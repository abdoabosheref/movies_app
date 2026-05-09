sealed class AuthState{}
class AuthInitial extends AuthState{}
class AuthLoading extends AuthState{}
class AuthSuccess extends AuthState{}
class AvatarChangedState extends AuthState{}
class AuthFailure extends AuthState{
  final String errorMessage;
  AuthFailure({required this.errorMessage});
}
class ChangePasswordVisibilityState extends AuthState{}