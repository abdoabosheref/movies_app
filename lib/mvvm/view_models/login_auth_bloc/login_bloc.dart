import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:movies_app/firebase_utils.dart';
import 'package:movies_app/mvvm/models/my_user.dart';
import 'package:movies_app/mvvm/view_models/login_auth_bloc/login_event.dart';
import 'package:movies_app/mvvm/view_models/login_auth_bloc/login_state.dart';
import 'package:google_sign_in/google_sign_in.dart';


class LoginBloc extends Bloc<LogInEvent, LoginState> {

  LoginBloc() : super(LoginInitial()) {
    on<EmailPasswordLogIn>((event, emit) async {

      emit(LoginLoading(message: 'Loading...'));
      await Future.delayed(Duration(seconds: 3));

      try {
        UserCredential userCredential = await FirebaseAuth.instance.signInWithEmailAndPassword(
          email: event.email,
          password: event.password,
        );
        User? firebaseUser = userCredential.user;

        if (firebaseUser != null) {
          MyUser user = MyUser(
              id: firebaseUser.uid,
              name: firebaseUser.displayName ?? '',
              email: firebaseUser.email ?? '',
              phone: firebaseUser.phoneNumber ?? '');
          await FirebaseUtils().saveUserToFireStore(user);
        }

        emit(LoginSuccess(message: 'Login Success'));

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
        emit(LoginError(message: errorMessage));
      } catch (e) {
        emit(LoginError(message: e.toString()));
      }
    });

    on<GoogleLogIn>((event,emit)async{
      emit(LoginLoading(message: 'Loading...'));
      await Future.delayed(Duration(seconds: 3));

    try{
      final GoogleSignIn googleSignIn = GoogleSignIn.instance;
      await googleSignIn.initialize(
        serverClientId:
        "524756747932-emeqnu0sh3i54omlf75pkk7tuaom5jv2.apps.googleusercontent.com" ,
      );
        final GoogleSignInAccount? googleUser = await googleSignIn.authenticate();
        final GoogleSignInAuthentication googleAuth = googleUser!.authentication;
        final credential = GoogleAuthProvider.credential(idToken: googleAuth.idToken);
      UserCredential userCredential = await FirebaseAuth.instance.signInWithCredential(credential);
      User? firebaseUser = userCredential.user;

      if (firebaseUser != null) {
        MyUser user = MyUser(
            id: firebaseUser.uid,
            name: firebaseUser.displayName ?? '',
            email: firebaseUser.email ?? '',
            phone: firebaseUser.phoneNumber ?? '');
        await FirebaseUtils().saveUserToFireStore(user);

      }
        emit(LoginSuccess(message: 'Login Success'));

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
        emit(LoginError(message: errorMessage));
        }catch (e){
        emit(LoginError(message: e.toString()));
        print(e.toString());
        }



    });

  }
}