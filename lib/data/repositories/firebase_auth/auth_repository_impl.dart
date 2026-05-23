import 'package:firebase_auth/firebase_auth.dart';

import '../../../api/models/firebase_auth/user_model.dart';
import '../../../domain/repositories/firebase_auth/auth_repository.dart';
import '../../data_sources/remote/firebase_auth/auth_remote_data_source.dart';

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