import 'package:flutter/material.dart';

class OnboardingModel {
  final String image;
  final String title;
  final String desc;

  OnboardingModel({
    required this.image,
    required this.title,
    this.desc='',
  });
}