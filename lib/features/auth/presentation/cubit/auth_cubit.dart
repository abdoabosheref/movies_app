import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:google_sign_in/google_sign_in.dart';
import 'package:movies_app/features/auth/data/models/user_model.dart';
import 'package:movies_app/firebase_utils.dart';
import 'package:movies_app/mvvm/models/my_user.dart';
import '../../data/data_sources/auth_remote_data_source.dart';
import '../../data/data_sources/auth_remote_data_source_impl.dart';
import '../../data/repository/auth_repository.dart';
import '../../data/repository/auth_repository_impl.dart';
import 'auth_states.dart';

class AuthCubit extends Cubit<AuthState> {
  final GlobalKey<FormState> authFormKey = GlobalKey<FormState>();
  TextEditingController emailController = TextEditingController();
  TextEditingController nameController = TextEditingController();
  TextEditingController passwordController = TextEditingController();
  TextEditingController confirmPasswordController = TextEditingController();
  TextEditingController phoneController = TextEditingController();
  int selectedIndex = 0;
  bool isPasswordHidden = true;
  bool isConfirmPasswordHidden = true;
  late AuthRepository authRepository;
  late AuthRemoteDataSource authRemoteDataSource;

  AuthCubit() : super(AuthInitial()) {
    authRemoteDataSource = AuthRemoteDataSourceImpl();
    authRepository = AuthRepositoryImpl(
      authRemoteDataSource: authRemoteDataSource,
    );
  }

  void clearControllers() {
    emailController.clear();
    nameController.clear();
    passwordController.clear();
    confirmPasswordController.clear();
    phoneController.clear();
  }

  void selectAvatar(int index) {
    selectedIndex = index;
    emit(AvatarChangedState());
  }

  Future<void> loginWithEmailAndPassword(String email, String password)async {

    emit(AuthLoading());

    try {
      UserCredential userCredential = await FirebaseAuth.instance.signInWithEmailAndPassword(
        email: email,
        password:password,
      );
      User? firebaseUser = userCredential.user;

      if (firebaseUser != null) {
        UserModel user = UserModel(
            id: firebaseUser.uid,
            name: firebaseUser.displayName ?? '',
            email: firebaseUser.email ?? '',
            phone: firebaseUser.phoneNumber ?? '');
        await FirebaseUtils().saveUserToFireStore(user);
      }

      emit(AuthSuccess(successMessage :'Login Success'));

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
      emit(AuthFailure(errorMessage: errorMessage));
    } catch (e) {
      emit(AuthFailure(errorMessage: e.toString()));
    }
  }

 Future<void>loginWithGoogle()async {
   emit(AuthLoading());
   await Future.delayed(Duration(seconds: 3));

   try{
     final GoogleSignIn googleSignIn = GoogleSignIn.instance;
     await googleSignIn.initialize(
       serverClientId:
       "524756747932-emeqnu0sh3i54omlf75pkk7tuaom5jv2.apps.googleusercontent.com" ,
     );
     final GoogleSignInAccount? googleUser = await googleSignIn.authenticate();
     final GoogleSignInAuthentication googleAuth = googleUser!.authentication;
     final credential = GoogleAuthProvider.credential(idToken: googleAuth.idToken);
     UserCredential userCredential = await FirebaseAuth.instance.signInWithCredential(credential);
     User? firebaseUser = userCredential.user;

     if (firebaseUser != null) {
       UserModel user = UserModel(
           id: firebaseUser.uid,
           name: firebaseUser.displayName ?? '',
           email: firebaseUser.email ?? '',
           phone: firebaseUser.phoneNumber ?? '');
       await FirebaseUtils().saveUserToFireStore(user);

     }
     emit(AuthSuccess(successMessage:  'Login Success'));

   } on FirebaseAuthException catch (e) {
     String errorMessage = 'An error occurred';
     if (e.code == 'user-not-found') {
       errorMessage = 'No user found for that email.';
     } else if (e.code == 'network-request-failed') {
       errorMessage = 'Check your internet connection.';
     } else if (e.code == 'invalid-email') {
       errorMessage = 'The email address is badly formatted.';
     } else {
       errorMessage = e.message ?? 'Authentication failed';
     }
     emit(AuthFailure(errorMessage: errorMessage));
   }catch (e){
     emit(AuthFailure(errorMessage: e.toString()));
     print(e.toString());
   }
 }


  Future<void> registerWithEmailAndPassword({
    required String email,
    required String password,
  }) async {
    try {
      emit(AuthLoading());
      await authRepository.registerWithEmailAndPassword(
        email: email,
        password: password,
      );
      emit(AuthSuccess());
    } catch (e) {
      emit(AuthFailure(errorMessage: e.toString()));
    }
  }

  void togglePasswordVisibility() {
    isPasswordHidden = !isPasswordHidden;
    emit(ChangePasswordVisibilityState());
  }

  void toggleConfirmPasswordVisibility() {
    isConfirmPasswordHidden = !isConfirmPasswordHidden;
    emit(ChangePasswordVisibilityState());
  }

  @override
  Future<void> close() {
    emailController.dispose();
    nameController.dispose();
    passwordController.dispose();
    confirmPasswordController.dispose();
    phoneController.dispose();
    return super.close();
  }

}
