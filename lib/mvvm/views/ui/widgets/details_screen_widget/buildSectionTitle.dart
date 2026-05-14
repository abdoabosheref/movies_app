import 'package:flutter/cupertino.dart';

import '../../../../../core/utils/app_styles.dart';

Widget buildSectionTitle(String title) {
  return Padding(
    padding: const EdgeInsets.all(16.0),
    child: Text(
        title,
        style: AppStyles.white24BoldInter
    ),
  );
}