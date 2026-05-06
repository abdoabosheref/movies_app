import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:movies_app/mvvm/view_models/login_auth_bloc/login_event.dart';
import 'package:movies_app/mvvm/view_models/login_auth_bloc/login_state.dart';

class LoginBloc extends Bloc<LoginEvent, LoginState> {
  LoginBloc() : super(LoginInitial()) {
    on<LoginSubmit>((event, emit) async {

      emit(LoginLoading(message: 'Loading...'));
      await Future.delayed(Duration(seconds: 3));

      try {
        await FirebaseAuth.instance.signInWithEmailAndPassword(
          email: event.email,
          password: event.password,
        );

        emit(LoginSuccess(message: 'Login Success'));
      } on FirebaseAuthException catch (e) {
        String errorMessage = 'An error occurred';
        if (e.code == 'user-not-found') {
          errorMessage = 'No user found for that email.';
        } else if (e.code == 'wrong-password') {
          errorMessage = 'Wrong password provided.';
        } else if (e.code == 'network-request-failed') {
          errorMessage = 'Check your internet connection.';
        } else if (e.code == 'invalid-email') {
          errorMessage = 'The email address is badly formatted.';
        } else {
          errorMessage = e.message ?? 'Authentication failed';
        }
        emit(LoginError(message: errorMessage));
      } catch (e) {
        emit(LoginError(message: e.toString()));
      }
    });
  }
}