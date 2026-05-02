import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:movies_app/mvvm/views/ui/screens/Login_screen/login_screen.dart';
import 'package:movies_app/mvvm/views/ui/screens/forget_password_screen/forget_password_screen.dart';
import 'package:movies_app/mvvm/views/ui/screens/main_screen/main_screen.dart';
import 'package:movies_app/mvvm/views/ui/screens/on_boarding_screen/on_boarding_screen.dart';
import 'package:movies_app/mvvm/views/ui/screens/register_screen/register_screen.dart';
import 'package:movies_app/mvvm/views/ui/screens/update_profile_screen/update_profile_screen.dart';
import 'core/utils/app_routes.dart';
import 'core/utils/app_theme.dart';
import 'package:firebase_core/firebase_core.dart';
import 'firebase_options.dart';


void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await EasyLocalization.ensureInitialized();
  await Firebase.initializeApp(
    options: DefaultFirebaseOptions.currentPlatform,
  );

  runApp(
    EasyLocalization(
      supportedLocales: [Locale('en'), Locale('ar')],
      path: 'assets/translations',
      fallbackLocale: Locale('en'),
      startLocale: Locale('en'),
      child: MovieApp(),
    ),
  );
}

class MovieApp extends StatelessWidget {
  const MovieApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      localizationsDelegates: context.localizationDelegates,
      supportedLocales: context.supportedLocales,
      locale: context.locale,
      title: 'Movie App',
      debugShowCheckedModeBanner: false,
      initialRoute: AppRoutes.onBoardingScreen,
      routes: {
        AppRoutes.onBoardingScreen: (context) => OnBoardingScreen(),
        AppRoutes.mainScreen: (context) => MainScreen(),
        AppRoutes.updateProfileScreen: (context) => UpdateProfileScreen(),
        AppRoutes.forgetPasswordScreen: (context) => ForgetPasswordScreen(),
        AppRoutes.registerScreen: (context) => RegisterScreen(),
        AppRoutes.loginScreen: (context) => LoginScreen(),

      },
      themeMode: ThemeMode.dark,
      darkTheme: AppTheme.darkTheme,
    );
  }
}
