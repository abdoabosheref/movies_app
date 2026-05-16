import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:movies_app/features/auth/data/models/user_model.dart';

import '../../data/data_sources/auth_remote_data_source.dart';
import '../../data/data_sources/auth_remote_data_source_impl.dart';
import '../../data/repository/auth_repository.dart';
import '../../data/repository/auth_repository_impl.dart';
import 'auth_states.dart';

class AuthCubit extends Cubit<AuthState> {
  // ------------ Update Controllers Section --------------
  final updateNameController = TextEditingController();
  final updatePhoneController = TextEditingController();
  // ------------ Login Controllers Section --------------
  final loginEmailController = TextEditingController();
  final loginPasswordController = TextEditingController();
  UserModel? currentUser;

  // ------------ Register Controllers Section --------------
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

  void setupUpdateProfile() {
    updateNameController.text = currentUser?.name ?? '';
    updatePhoneController.text = currentUser?.phone ?? '';
    selectedAvatarIndex = currentUser?.avatarIndex ?? 0;
  }

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
      final credential = await authRepository.loginWithEmailAndPassword(
        email: email,
        password: password,
      );
      currentUser = await authRepository.getUserData(uId: credential.user!.uid);
      if (currentUser != null) {
        emit(AuthSuccess());
      } else {
        emit(AuthFailure(errorMessage: "User data not found"));
      }
    } catch (e) {
      emit(AuthFailure(errorMessage: e.toString()));
    }
  }

  Future<void> loginWithGoogle() async {
    // await Future.delayed(Duration(seconds: 3));
    try {
      emit(AuthLoading());
      final credential = await authRepository.loginWithGoogle();
      currentUser = await authRepository.getUserData(uId: credential.user!.uid);
      if (currentUser != null) {
        emit(AuthSuccess());
      } else {
        emit(AuthFailure(errorMessage: "User data not found"));
      }
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

  Future<void> updateUserData({
    String? newName,
    String? newPhone,
    int? newAvatarIndex,
  }) async {
    try {
      emit(AuthLoading());
      if (currentUser != null) {
        UserModel updatedUser = currentUser!.copyWith(
          name: newName ?? currentUser!.name,
          phone: newPhone ?? currentUser!.phone,
          avatarIndex: newAvatarIndex ?? currentUser!.avatarIndex,
        );

        await authRepository.updateUserData(userModel: updatedUser);
        currentUser = updatedUser;
        emit(AuthSuccess());
      } else {
        emit(AuthFailure(errorMessage: "No user is currently logged in"));
      }
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
