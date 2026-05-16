import 'package:flutter/material.dart';
import 'package:movies_app/mvvm/views/ui/widgets/custom_cached_network_image.dart';

import '../../../../../core/utils/app_colors.dart';
import '../../../../../core/utils/app_styles.dart';

Widget buildCastItem(String image, String name, String character) {
  return Container(
    margin: const EdgeInsets.only(bottom: 12),
    padding: const EdgeInsets.all(8),
    decoration: BoxDecoration(
      color: AppColors.darkGrey,
      borderRadius: BorderRadius.circular(15),
    ),
    child: Row(
      children: [
        ClipRRect(
          borderRadius: BorderRadius.circular(10),
          child: CustomCachedNetworkImage(imageString: image),
        )),
        const SizedBox(width: 12),
        Expanded(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text("Name : $name",
                  style: AppStyles.white20RegularRoboto),
              Text("Character : $character",
                  style: AppStyles.white20RegularRoboto),
            ],
          ),
        ),
      ],
    ),
  );
}