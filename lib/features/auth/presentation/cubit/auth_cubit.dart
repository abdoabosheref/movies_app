import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:movies_app/features/auth/data/models/user_model.dart';

import '../../data/data_sources/auth_remote_data_source.dart';
import '../../data/data_sources/auth_remote_data_source_impl.dart';
import '../../data/repository/auth_repository.dart';
import '../../data/repository/auth_repository_impl.dart';
import 'auth_states.dart';

class AuthCubit extends Cubit<AuthState> {
  final GlobalKey<FormState> registerFormKey = GlobalKey<FormState>();
  TextEditingController emailController = TextEditingController();
  TextEditingController nameController = TextEditingController();
  TextEditingController passwordController = TextEditingController();
  TextEditingController confirmPasswordController = TextEditingController();
  TextEditingController phoneController = TextEditingController();
  int selectedAvatarIndex = 0;
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

  void selectAvatar(int currentAvatarIndex) {
    selectedAvatarIndex = currentAvatarIndex;
    emit(AvatarChangedState());
  }

  Future<void> registerWithEmailAndPassword({
    required String email,
    required String password,
  }) async {
    try {
      emit(AuthLoading());
      UserModel userModel = UserModel(
        uId: '',
        name: nameController.text,
        email: emailController.text,
        phone: phoneController.text,
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
