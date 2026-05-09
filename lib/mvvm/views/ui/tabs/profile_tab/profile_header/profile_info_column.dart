import 'package:flutter/material.dart';
import 'package:movies_app/core/utils/app_styles.dart';

import '../../../../../../core/utils/app_context.dart';

class ProfileInfoColumn extends StatelessWidget {
  final int counter;
  final String labelText;
  const ProfileInfoColumn({
    super.key,
    required this.labelText,
    required this.counter,
  });

  @override
  Widget build(BuildContext context) {
    double screenHeight = context.screenHeight;
    return Column(
      spacing: screenHeight * 0.01,
      children: [
        Text('$counter', style: AppStyles.white30BoldRoboto),
        Text(labelText, style: AppStyles.white22BoldRoboto),
      ],
    );
  }
}
