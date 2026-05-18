import 'package:flutter/material.dart';
import 'package:movies_app/features/screens/forget_password_screen/forget_password_screen.dart';
import 'package:movies_app/features/screens/main_screen/main_screen.dart';
import 'package:movies_app/features/screens/movie_details/movie_details_screen/movie_details_screen.dart';
import 'package:movies_app/features/screens/on_boarding_screen/on_boarding_screen.dart';
import 'package:movies_app/features/screens/update_profile_screen/update_profile_screen.dart';

import '../../features/auth/presentation/screens/login_screen.dart';
import '../../features/auth/presentation/screens/register_screen.dart';

class AppRoutes {
  static const String onBoardingScreen = '/on_boarding_screen';
  static const String updateProfileScreen = '/update_profile_screen';
  static const String mainScreen = '/main_screen';
  static const String movieDetailsScreen = '/movie_details_screen';
  static const String forgetPasswordScreen = '/forget_password_screen';
  static const String registerScreen = '/register_screen';
  static const String loginScreen = '/login_screen';

  static Map<String, Widget Function(BuildContext)> routes = {
    AppRoutes.onBoardingScreen: (_) => OnBoardingScreen(),
    AppRoutes.mainScreen: (_) => MainScreen(),
    AppRoutes.movieDetailsScreen: (_) => const MovieDetailsScreen(),
    AppRoutes.updateProfileScreen: (_) => UpdateProfileScreen(),
    AppRoutes.forgetPasswordScreen: (_) => ForgetPasswordScreen(),
    AppRoutes.registerScreen: (context) => RegisterScreen(),
    AppRoutes.loginScreen: (context) => LoginScreen(),
  };
}
