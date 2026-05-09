import '../models/user_model.dart';

abstract class AuthRepository {
  Future<void> registerWithEmailAndPassword(
      {required String email, required String password, required UserModel userModel});
}