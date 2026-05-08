abstract class AuthRepository {
  Future<void> registerWithEmailAndPassword({required String email,
    required String password});
}