import 'package:firebase_auth/firebase_auth.dart';
import 'package:google_sign_in/google_sign_in.dart';

import '../models/user_model.dart';
import 'auth_remote_data_source.dart';

class AuthRemoteDataSourceImpl implements AuthRemoteDataSource {
  @override
  Future<void> registerWithEmailAndPassword({
    required String email,
    required String password,
    required UserModel userModel,
  }) async {
    try {
      final credential = await FirebaseAuth.instance
          .createUserWithEmailAndPassword(email: email, password: password);
      await UserModel.collection()
          .doc(credential.user!.uid)
          .set(userModel.copyWith(uId: credential.user!.uid));
    } on FirebaseAuthException catch (e) {
      if (e.code == 'weak-password') {
        throw 'The password provided is too weak.';
      } else if (e.code == 'email-already-in-use') {
        throw 'The account already exists for that email.';
      }
    } catch (e) {
      throw e.toString();
    }
  }

  @override
  Future<UserCredential> loginWithEmailAndPassword({
    required String email,
    required String password,
  }) async {
    try {
      UserCredential userCredential = await FirebaseAuth.instance
          .signInWithEmailAndPassword(email: email, password: password);
      return userCredential;
    } on FirebaseAuthException catch (e) {
      String errorMessage = 'An error occurred';
      if (e.code == 'user-not-found') {
        errorMessage = 'No user found for that email.';
      } else if (e.code == 'wrong-password') {
        errorMessage = 'Wrong password provided.';
      } else if (e.code == 'network-request-failed') {
        errorMessage = 'Check your internet connection.';
      } else if (e.code == 'invalid-email') {
        errorMessage = 'The email address is badly formatted.';
      } else {
        errorMessage = e.message ?? 'Authentication failed';
      }
      throw errorMessage;
    } catch (e) {
      throw e.toString();
    }
  }

  @override
  Future<UserCredential> loginWithGoogle() async {
    try {
      final GoogleSignIn googleSignIn = GoogleSignIn.instance;
      await googleSignIn.initialize(
        serverClientId:
            "524756747932-ktsrr4ilk5cvvsvt221a4r92i2pn93qs.apps.googleusercontent.com",
      );
      final GoogleSignInAccount googleUser = await googleSignIn.authenticate();
      final GoogleSignInAuthentication googleAuth = googleUser.authentication;
      final credential = GoogleAuthProvider.credential(
        idToken: googleAuth.idToken,
      );
      UserCredential userCredential = await FirebaseAuth.instance
          .signInWithCredential(credential);
      User? firebaseUser = userCredential.user;

      if (firebaseUser != null) {
        final userDoc = await getUserData(uId: firebaseUser.uid);
        if (userDoc == null) {
          UserModel user = UserModel(
            uId: firebaseUser.uid,
            name: firebaseUser.displayName ?? 'User',
            email: firebaseUser.email ?? '',
            phone: firebaseUser.phoneNumber ?? '',
            avatarIndex: 0,
          );
          await UserModel.collection().doc(user.uId).set(user);
        }
      }
      return userCredential;
    } on FirebaseAuthException catch (e) {
      String errorMessage = 'An error occurred';
      if (e.code == 'user-not-found') {
        errorMessage = 'No user found for that email.';
      } else if (e.code == 'network-request-failed') {
        errorMessage = 'Check your internet connection.';
      } else if (e.code == 'invalid-email') {
        errorMessage = 'The email address is badly formatted.';
      } else {
        errorMessage = e.message ?? 'Authentication failed';
      }
      throw errorMessage;
    } catch (e) {
      throw e.toString();
    }
  }

  @override
  Future<UserModel?> getUserData({required String uId}) async {
    try {
      var doc = await UserModel.collection().doc(uId).get();
      return doc.data();
    } catch (e) {
      throw e.toString();
    }
  }

  @override
  Future<void> updateUserData({required UserModel userModel}) async {
    try {
      await UserModel.collection()
          .doc(userModel.uId)
          .update(userModel.toFireStore());
    } catch (e) {
      throw e.toString();
    }
  }
}
