import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:movies_app/mvvm/view_models/login_auth_bloc/login_bloc.dart';

import '../../features/auth/presentation/cubit/auth_cubit.dart';
import '../../features/auth/presentation/screens/register_screen.dart';
import '../../features/auth/presentation/screens/login_screen.dart';
import '../../mvvm/views/ui/screens/forget_password_screen/forget_password_screen.dart';
import '../../mvvm/views/ui/screens/main_screen/main_screen.dart';
import '../../mvvm/views/ui/screens/on_boarding_screen/on_boarding_screen.dart';
import '../../mvvm/views/ui/screens/update_profile_screen/update_profile_screen.dart';

class AppRoutes {
  static const String onBoardingScreen = '/on_boarding_screen';
  static const String updateProfileScreen = '/update_profile_screen';
  static const String mainScreen = '/main_screen';
  static const String forgetPasswordScreen = '/forget_password_screen';
  static const String registerScreen = '/register_screen';
  static const String loginScreen = '/login_screen';

  static Map<String, Widget Function(BuildContext)> routes = {
    AppRoutes.onBoardingScreen: (_) => OnBoardingScreen(),
    AppRoutes.mainScreen: (_) => MainScreen(),
    AppRoutes.updateProfileScreen: (_) => UpdateProfileScreen(),
    AppRoutes.forgetPasswordScreen: (_) => ForgetPasswordScreen(),
    AppRoutes.registerScreen: (context) => BlocProvider(create: (context) => AuthCubit(),child: RegisterScreen()),
    AppRoutes.loginScreen: (context) => BlocProvider(
        create: (context) => AuthCubit(),
        child: LoginScreen()),
  };




}