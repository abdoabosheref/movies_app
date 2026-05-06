abstract class LoginEvent {}

 class LoginSubmit extends LoginEvent {
   final String email;
   final String password;
   LoginSubmit(this.email, this.password);

 }



