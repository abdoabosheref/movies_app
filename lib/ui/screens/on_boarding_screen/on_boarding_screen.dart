import 'package:flutter/material.dart';
import 'package:movies_app/data/onboarding_data..dart';
import 'package:movies_app/ui/screens/home_screen/home_screen.dart';
import 'onboarding_widget/onboarding_bottom_card.dart';


class OnboardingScreen extends StatefulWidget {
  const OnboardingScreen({super.key});

  @override
  State<OnboardingScreen> createState() => _OnBoardingScreenState();
}

class _OnBoardingScreenState extends State<OnboardingScreen> {
  final PageController pageController = PageController();
  int currentIndex = 0;


  @override
  Widget build(BuildContext context) {
    final data = getOnboardingData(context);

    return Scaffold(
      body: Stack(
        children: [
          PageView.builder(
            controller: pageController,
            itemCount: data.length,
            onPageChanged: (i) => setState(() => currentIndex = i),
            itemBuilder: (context, index) {
              return Image.asset(data[index].image,width: double.infinity,fit: BoxFit.cover,
              height: double.infinity,);
            },
          ),

          Align(
            alignment: Alignment.bottomCenter,
            child: OnboardingBottomCard(
              item: data[currentIndex],
              index: currentIndex,
              length: data.length,

              onNext: () {
                if (currentIndex == data.length - 1) {
                  Navigator.pushReplacement(
                    context,
                    MaterialPageRoute(
                      builder: (_) => const HomeScreen(),
                    ),
                  );
                } else {
                  pageController.nextPage(
                    duration: const Duration(milliseconds: 400),
                    curve: Curves.easeInOut,
                  );
                }
              },

              onBack: () {
                pageController.previousPage(
                  duration: const Duration(milliseconds: 400),
                  curve: Curves.easeInOut,
                );
              },
            ),
          ),
        ],
      ),
    );
  }
}