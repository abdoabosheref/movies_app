import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:movies_app/ui/screens/on_boarding_screen/on_boarding_screen.dart';
import 'package:movies_app/ui/tabs/profile_tab/profile_tab.dart';
import 'package:movies_app/ui/screens/update_profile_screen.dart';

import 'core/utils/app_routes.dart';
import 'core/utils/app_theme.dart';


void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await EasyLocalization.ensureInitialized();
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
      initialRoute: AppRoutes.updateProfileScreen,
      routes: {
        AppRoutes.onBoardingScreen: (context) => OnboardingScreen(),
        AppRoutes.profileTab: (context) => ProfileTab(),
        AppRoutes.updateProfileScreen: (context) => UpdateProfileScreen(),
      },
      themeMode: ThemeMode.dark,
      darkTheme: AppTheme.darkTheme,
    );
  }
}
