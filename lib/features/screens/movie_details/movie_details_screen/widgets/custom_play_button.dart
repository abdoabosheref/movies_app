import 'package:flutter/material.dart';
import 'package:movies_app/core/utils/app_assets.dart';
import 'package:movies_app/core/utils/app_context.dart';

class CustomPlayButton extends StatelessWidget {
  final String movieTitle ;
  const CustomPlayButton({super.key,required this.movieTitle});

  @override
  Widget build(BuildContext context) {
    double screenHeight = context.screenHeight;
    double screenWidth = context.screenWidth;
    return SizedBox(
      height: screenHeight * 0.77,
      child: Center(
        child: GestureDetector(
          onTap: () {
            ScaffoldMessenger.of(context).showSnackBar(
              SnackBar(
                content: Text(
                  "Playing $movieTitle trailer...",
                ),
              ),
            );
          },
          child: Image.asset(
            AppAssets.playIcon,
            width: screenWidth * 0.22,
          ),
        ),
      ),
    );
  }
}
