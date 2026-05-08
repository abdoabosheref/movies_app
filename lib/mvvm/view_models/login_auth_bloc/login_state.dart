abstract class LoginState {}

class LoginInitial extends LoginState {}

class LoginLoading extends LoginState {
  final String message ;
  LoginLoading({required this.message});
}
class LoginSuccess extends LoginState {
  final String message ;
  LoginSuccess({required this.message});
}
class LoginError extends LoginState {
  final String message ;
  LoginError({required this.message});
}

