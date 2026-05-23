sealed class AuthState{}
class AuthInitial extends AuthState{}
class AuthLoading extends AuthState{}
class RegisterSuccess extends AuthState{
  final String? successMessage;
  RegisterSuccess({ this.successMessage});
}
class LoginSuccess extends AuthState{
  final String? successMessage;
  LoginSuccess({ this.successMessage});
}
class AuthSuccess extends AuthState{
  final String? successMessage;
  AuthSuccess({ this.successMessage});
}
class AvatarChangedState extends AuthState{}
class AuthFailure extends AuthState{
  final String errorMessage;
  AuthFailure({required this.errorMessage});
}
class ChangePasswordVisibilityState extends AuthState{}
class AuthDeleteSuccess extends AuthState{
  final String? successMessage;
  AuthDeleteSuccess({ this.successMessage});
}
class AuthDeleteFailure extends AuthState{
  final String errorMessage;
  AuthDeleteFailure({required this.errorMessage});
}