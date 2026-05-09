import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:movies_app/features/auth/data/models/user_model.dart';

import '../../data/data_sources/auth_remote_data_source.dart';
import '../../data/data_sources/auth_remote_data_source_impl.dart';
import '../../data/repository/auth_repository.dart';
import '../../data/repository/auth_repository_impl.dart';
import 'auth_states.dart';

class AuthCubit extends Cubit<AuthState> {
  // ------------ Login Controllers Section --------------
  final loginEmailController = TextEditingController();
  final loginPasswordController = TextEditingController();
  final loginFormKey = GlobalKey<FormState>();

  // ------------ Register Controllers Section --------------
  final GlobalKey<FormState> registerFormKey = GlobalKey<FormState>();
  TextEditingController registerEmailController = TextEditingController();
  TextEditingController registerNameController = TextEditingController();
  TextEditingController registerPasswordController = TextEditingController();
  TextEditingController registerConfirmPasswordController =
      TextEditingController();
  TextEditingController registerPhoneController = TextEditingController();

  // ------------ General Variables Section --------------

  int selectedAvatarIndex = 0;
  bool isPasswordHidden = true;
  bool isConfirmPasswordHidden = true;
  late AuthRepository authRepository;
  late AuthRemoteDataSource authRemoteDataSource;

  // ------------ Constructor Section --------------

  AuthCubit() : super(AuthInitial()) {
    authRemoteDataSource = AuthRemoteDataSourceImpl();
    authRepository = AuthRepositoryImpl(
      authRemoteDataSource: authRemoteDataSource,
    );
  }

  // ------------ Functions Section --------------

  void registerClearControllers() {
    // registerFormKey.currentState?.reset();

    registerNameController.clear();
    registerEmailController.clear();
    registerPasswordController.clear();
    registerConfirmPasswordController.clear();
    registerPhoneController.clear();
  }

  void loginClearControllers() {
    // loginFormKey.currentState?.reset();
    loginEmailController.clear();
    loginPasswordController.clear();
  }

  void selectAvatar(int currentAvatarIndex) {
    selectedAvatarIndex = currentAvatarIndex;
    emit(AvatarChangedState());
  }

  Future<void> loginWithEmailAndPassword(String email, String password) async {
    try {
      emit(AuthLoading());
      await authRepository.loginWithEmailAndPassword(
        email: email,
        password: password,
      );
      emit(AuthSuccess());
    } catch (e) {
      emit(AuthFailure(errorMessage: e.toString()));
    }
  }

  Future<void> loginWithGoogle() async {
    // await Future.delayed(Duration(seconds: 3));
    try {
      emit(AuthLoading());
      await authRepository.loginWithGoogle();
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

  Future<void> registerWithEmailAndPassword({
    required String email,
    required String password,
  }) async {
    try {
      emit(AuthLoading());
      UserModel userModel = UserModel(
        uId: '',
        name: registerNameController.text,
        email: registerEmailController.text,
        phone: registerPhoneController.text,
        avatarIndex: selectedAvatarIndex,
      );

      await authRepository.registerWithEmailAndPassword(
        email: email,
        password: password,
        userModel: userModel,
      );
      emit(AuthSuccess());
    } catch (e) {
      emit(AuthFailure(errorMessage: e.toString()));
    }
  }

  @override
  Future<void> close() {
    // ------------ Register Controllers Section --------------
    registerNameController.dispose();
    registerEmailController.dispose();
    registerPasswordController.dispose();
    registerConfirmPasswordController.dispose();
    registerPhoneController.dispose();
    // ------------ Login Controllers Section --------------
    loginPasswordController.dispose();
    loginEmailController.dispose();
    return super.close();
  }
}
