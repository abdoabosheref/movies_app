import 'package:flutter/material.dart';
import 'package:movies_app/core/utils/app_colors.dart';

class MainLoading extends StatelessWidget {
  const MainLoading({super.key});

  @override
  Widget build(BuildContext context) {
    return Center(
      child: CircularProgressIndicator(
        padding: EdgeInsets.all(10),
        color: AppColors.yellow,
      ),
    );
  }
}
