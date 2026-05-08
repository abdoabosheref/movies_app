sealed class AuthState{}
class AuthInitial extends AuthState{}
class AuthLoading extends AuthState{}
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