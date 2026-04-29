import 'package:flutter/material.dart';
import '../../../core/data_model/OnboardingModel.dart';

class OnboardingBackground extends StatelessWidget {
  final OnboardingModel item;

  const OnboardingBackground({super.key, required this.item});

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        SizedBox.expand(child: item.image),

        Container(
          decoration: BoxDecoration(
            gradient: LinearGradient(
              colors: item.gradient,
              begin: Alignment.topCenter,
              end: Alignment.bottomCenter,
            ),
          ),
        ),
      ],
    );
  }
}