import 'package:firebase_auth/firebase_auth.dart';

import 'auth_remote_data_source.dart';

class AuthRemoteDataSourceImpl implements AuthRemoteDataSource{
  @override
  Future<void> registerWithEmailAndPassword({required String email,required String password}) async{
    try {
      final credential = await FirebaseAuth.instance.createUserWithEmailAndPassword(
        email: email,
        password: password,
      );
    } on FirebaseAuthException catch (e) {
      if (e.code == 'weak-password') {
       throw'The password provided is too weak.';
      } else if (e.code == 'email-already-in-use') {
       throw 'The account already exists for that email.';
      }
    } catch (e) {
      throw e.toString();
    }

  }

}