import 'package:flutter/material.dart';
import 'package:movies_app/core/utils/app_styles.dart';

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
    return Column(
      children: [
        Text('$counter', style: AppStyles.white36BoldRoboto),
        Text(labelText, style: AppStyles.white24BoldRoboto),
      ],
    );
  }
}
