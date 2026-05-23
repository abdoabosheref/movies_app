import 'package:easy_localization/easy_localization.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'core/di/di.dart';
import 'core/utils/app_routes.dart';
import 'core/utils/app_theme.dart';
import 'features/auth/presentation/cubit/auth_cubit.dart';
import 'features/localization/presentation/cubit/local_cubit.dart';
import 'firebase_options.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await EasyLocalization.ensureInitialized();
  await Firebase.initializeApp(options: DefaultFirebaseOptions.currentPlatform);
  final prefs = await SharedPreferences.getInstance();
  final bool showOnBoarding = prefs.getBool('showOnBoarding') ?? true;
  configureDependencies();

  runApp(
    EasyLocalization(
      supportedLocales: [Locale('en'), Locale('ar')],
      path: 'assets/translations',
      fallbackLocale: Locale('en'),
      child: Builder(
        builder: (context) {
          final initialLanguage = EasyLocalization.of(
            context,
          )!.locale.languageCode;
          return MultiBlocProvider(
            providers: [
              BlocProvider(
                create: (_) => LocalCubit(currentLanguageCode: initialLanguage),
              ),
              BlocProvider(create: (context) => AuthCubit()),
            ],
            child: MovieApp(showOnBoarding: showOnBoarding),
          );
        },
      ),
    ),
  );
}

class MovieApp extends StatelessWidget {
  final bool showOnBoarding;

  const MovieApp({super.key, required this.showOnBoarding});

  @override
  Widget build(BuildContext context) {

    return MaterialApp(
      debugShowCheckedModeBanner: false,
      localizationsDelegates: context.localizationDelegates,
      supportedLocales: context.supportedLocales,
      locale: context.locale,
      title: 'Movie App',
      initialRoute: showOnBoarding
          ? AppRoutes.onBoardingScreen
          : AppRoutes.authScreenPicker,
      routes: AppRoutes.routes,
      themeMode: ThemeMode.dark,
      darkTheme: AppTheme.darkTheme,
    );
  }}

