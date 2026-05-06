import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:movies_app/mvvm/views/ui/screens/Login_screen/login_screen.dart';
import 'package:movies_app/mvvm/views/ui/screens/forget_password_screen/forget_password_screen.dart';
import 'package:movies_app/mvvm/views/ui/screens/main_screen/main_screen.dart';
import 'package:movies_app/mvvm/views/ui/screens/on_boarding_screen/on_boarding_screen.dart';
import 'package:movies_app/mvvm/views/ui/screens/register_screen/register_screen.dart';
import 'package:movies_app/mvvm/views/ui/screens/update_profile_screen/update_profile_screen.dart';
import 'package:movies_app/mvvm/views/ui/widgets/custom_toast.dart';
import 'package:shared_preferences/shared_preferences.dart';
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

  final prefs = await SharedPreferences.getInstance();
  final bool showOnboarding = prefs.getBool('showOnboarding') ?? true;

  runApp(
    EasyLocalization(
      supportedLocales: [Locale('en'), Locale('ar')],
      path: 'assets/translations',
      fallbackLocale: Locale('en'),
      startLocale: Locale('en'),
      child: MovieApp(showOnboarding: showOnboarding),
    ),
  );
}

class MovieApp extends StatelessWidget {
  final bool showOnboarding;
  const MovieApp({super.key, required this.showOnboarding});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      localizationsDelegates: context.localizationDelegates,
      supportedLocales: context.supportedLocales,
      locale: context.locale,
      title: 'Movie App',
      initialRoute: showOnboarding ? AppRoutes.onBoardingScreen : AppRoutes.loginScreen,
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
