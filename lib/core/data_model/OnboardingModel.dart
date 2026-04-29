import 'package:flutter/material.dart';

class OnboardingModel {
  final Widget image;
  final String title;
  final String desc;
  final List<Color> gradient;

  OnboardingModel({
    required this.image,
    required this.title,
    required this.desc,
    required this.gradient,
  });
}