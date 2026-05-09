import '../models/user_model.dart';

abstract class AuthRemoteDataSource {
  Future<void> registerWithEmailAndPassword({
    required String email,
    required String password,
    required UserModel userModel,
  });

  Future<void> loginWithEmailAndPassword({
    required String email,
    required String password,
  });

  Future<void> loginWithGoogle();
}
