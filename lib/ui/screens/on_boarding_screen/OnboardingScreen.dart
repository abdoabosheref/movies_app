import 'package:flutter/material.dart';
import 'package:movies_app/data/onboarding_data..dart';
import 'package:movies_app/ui/screens/home_screen/home_screen.dart';
import 'onboarding_widget/onboarding_background.dart';
import 'onboarding_widget/onboarding_bottom_card.dart';


class OnboardingScreen extends StatefulWidget {
  const OnboardingScreen({super.key});

  @override
  State<OnboardingScreen> createState() => _OnboardingScreenState();
}

class _OnboardingScreenState extends State<OnboardingScreen> {
  final PageController controller = PageController();
  int currentIndex = 0;

  @override
  Widget build(BuildContext context) {
    final data = getOnboardingData(context);

    return Scaffold(
      body: Stack(
        children: [
          /// PAGES
          PageView.builder(
            controller: controller,
            itemCount: data.length,
            onPageChanged: (i) => setState(() => currentIndex = i),
            itemBuilder: (context, index) {
              return OnboardingBackground(item: data[index]);
            },
          ),

          /// BOTTOM
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
                  controller.nextPage(
                    duration: const Duration(milliseconds: 400),
                    curve: Curves.easeInOut,
                  );
                }
              },

              onBack: () {
                controller.previousPage(
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