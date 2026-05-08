abstract class LogInEvent {}

 class EmailPasswordLogIn extends LogInEvent {
   final String email;
   final String password;
   EmailPasswordLogIn(this.email, this.password);

 }

class GoogleLogIn extends LogInEvent {}

class SignOut extends LogInEvent {}

