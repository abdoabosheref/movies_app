import 'package:flutter/material.dart';
import 'package:movies_app/core/data_model/OnboardingModel.dart';
import 'package:movies_app/core/utils/app_assets.dart';

class OnboardingBackground extends StatelessWidget {
  final OnboardingModel item;

  const OnboardingBackground({super.key, required this.item});

  @override
  Widget build(BuildContext context) {
    return SizedBox.expand(child: Image.asset(item.image));
  }
}