import 'package:flutter/material.dart';

import '../../../../../core/utils/app_colors.dart';
import '../../../../../core/utils/app_styles.dart';

Widget buildGenreChip(String label) {
  return Container(
    padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 8),
    decoration: BoxDecoration(
      color: AppColors.darkGrey,
      borderRadius: BorderRadius.circular(12),
    ),
    child: Text(label, style: AppStyles.white16RegularRoboto),
  );
}