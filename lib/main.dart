import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:movies_app/ui/screens/on_boarding_screen.dart';

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
      initialRoute: AppRoutes.onBoarding,
      routes: {AppRoutes.onBoarding: (context) => OnBoardingScreen()},
      themeMode: ThemeMode.light,
      darkTheme: AppTheme.darkTheme,
    );
  }
}
