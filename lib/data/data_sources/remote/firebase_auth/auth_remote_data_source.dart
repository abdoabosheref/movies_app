import 'package:firebase_auth/firebase_auth.dart';

import '../../../../api/models/firebase_auth/user_model.dart';

abstract class AuthRemoteDataSource {
  Future<void> registerWithEmailAndPassword({
    required String email,
    required String password,
    required UserModel userModel,
  });

  Future<UserCredential> loginWithEmailAndPassword({
    required String email,
    required String password,
  });

  Future<UserCredential> loginWithGoogle();

  Future<UserModel?> getUserData({required String uId});

  Future<void> updateUserData({required UserModel userModel});
}
