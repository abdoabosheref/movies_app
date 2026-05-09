import 'package:flutter/material.dart';
import 'package:movies_app/core/utils/app_routes.dart';
import 'package:shared_preferences/shared_preferences.dart';

import '../../../../models/on_boarding_model.dart';
import 'onboarding_widget/onboarding_bottom_card.dart';

class OnBoardingScreen extends StatefulWidget {
  const OnBoardingScreen({super.key});

  @override
  State<OnBoardingScreen> createState() => _OnBoardingScreenState();
}

class _OnBoardingScreenState extends State<OnBoardingScreen> {
  final onBoardingDataList = onBoardingData;
  final PageController pageController = PageController();
  int currentIndex = 0;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        children: [
          /// PAGES
          PageView.builder(
            controller: pageController,
            itemCount: onBoardingDataList.length,
            onPageChanged: (i) => setState(() => currentIndex = i),
            itemBuilder: (context, index) {
              return Image.asset(
                onBoardingDataList[index].image,
                width: double.infinity,
                fit: BoxFit.cover,
                height: double.infinity,
              );
            },
          ),

          /// BOTTOM
          Align(
            alignment: Alignment.bottomCenter,
            child: OnBoardingBottomCard(
              currentIndex: currentIndex,
              onNext: _onNext,
              onBack: _onBack,
            ),
          ),
        ],
      ),
    );
  }

  void _onNext() async {
    if (currentIndex == onBoardingDataList.length - 1) {
      final prefs = await SharedPreferences.getInstance();
      await prefs.setBool('showOnBoarding', false);

      if (mounted) {
        Navigator.of(context).pushReplacementNamed(
          AppRoutes.loginScreen,
        );
      }
    } else {
      pageController.nextPage(
        duration: const Duration(milliseconds: 400),
        curve: Curves.easeInOut,
      );
    }
  }

  void _onBack() {
    pageController.previousPage(
      duration: const Duration(milliseconds: 400),
      curve: Curves.easeInOut,
    );
  }

  @override
  void dispose() {
    // TODO: implement dispose
    pageController.dispose();
    super.dispose();
  }
}
