import 'package:flutter/material.dart';
import 'package:flutter_localizations/flutter_localizations.dart';
import 'package:movies_app/utils/app_icon.dart';
import 'package:movies_app/utils/app_image.dart';
import 'package:movies_app/utils/app_style.dart';
import 'l10n/app_localizations.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      locale: const Locale('en'),
      localizationsDelegates: [
        AppLocalizations.delegate,
        GlobalMaterialLocalizations.delegate,
        GlobalWidgetsLocalizations.delegate,
        GlobalCupertinoLocalizations.delegate,
      ],
      supportedLocales: [
        Locale('en'), // English
        Locale('ar'), // Spanish
      ],
      home: Scaffold(
        body: Builder(
          builder: (context) {
            return Scaffold(
              body: Center(
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Text(
                      AppLocalizations.of(context)!.name,
                      style: AppStyle.reg20Black,
                    ),

                    IconButton(onPressed: () {}, icon: AppIcon.homeTabSel),
                    IconButton(onPressed: () {}, icon: AppImage.ma1),
                  ],
                ),
              ),
            );
          },
        ),
      ),
    );
  }
}
