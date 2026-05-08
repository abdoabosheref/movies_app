import '../data_sources/auth_remote_data_source.dart';
import 'auth_repository.dart';

class AuthRepositoryImpl implements AuthRepository{
  AuthRemoteDataSource authRemoteDataSource;
  AuthRepositoryImpl({required this.authRemoteDataSource});
  @override
  Future<void> registerWithEmailAndPassword({required String email, required String password}) {
    return authRemoteDataSource.registerWithEmailAndPassword(email: email, password: password);

  }


}