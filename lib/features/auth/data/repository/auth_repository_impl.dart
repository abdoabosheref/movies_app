import 'package:firebase_auth/firebase_auth.dart';

import '../data_sources/auth_remote_data_source.dart';
import '../models/user_model.dart';
import 'auth_repository.dart';

class AuthRepositoryImpl implements AuthRepository{
  AuthRemoteDataSource authRemoteDataSource;
  AuthRepositoryImpl({required this.authRemoteDataSource});
  @override
  Future<void> registerWithEmailAndPassword(
      {required String email, required String password, required UserModel userModel}) {
    return authRemoteDataSource.registerWithEmailAndPassword(
        email: email, password: password, userModel: userModel);
  }

  @override
  Future<UserCredential> loginWithEmailAndPassword(
      {required String email, required String password}) {
    return authRemoteDataSource.loginWithEmailAndPassword(
        email: email, password: password);
  }

  @override
  Future<UserCredential> loginWithGoogle() {
    return authRemoteDataSource.loginWithGoogle();
  }

  @override
  Future<UserModel?> getUserData({required String uId}) {
    return authRemoteDataSource.getUserData(uId: uId);
  }

  @override
  Future<void> updateUserData({required UserModel userModel}) {
    return authRemoteDataSource.updateUserData(userModel: userModel);
  }

}