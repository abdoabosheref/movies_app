import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:carousel_slider/carousel_slider.dart';
import 'package:movies_app/core/utils/app_assets.dart';
import 'package:movies_app/core/utils/app_context.dart';
import 'package:movies_app/core/utils/app_styles.dart';

class CustomAvatarSlider extends StatelessWidget {
  const CustomAvatarSlider({super.key});

  @override
  Widget build(BuildContext context) {
    List<String> avatarList = [
      AppAssets.avatarImage1,
      AppAssets.avatarImage2,
      AppAssets.avatarImage3,
      AppAssets.avatarImage4,
      AppAssets.avatarImage5,
      AppAssets.avatarImage6,
      AppAssets.avatarImage7,
      AppAssets.avatarImage8,
      AppAssets.avatarImage9,
    ];
    double screenHeight = context.screenHeight;
    return Column(
      mainAxisSize: .min,
      spacing: screenHeight * 0.003,
      children: [
        CarouselSlider(
          options: CarouselOptions(
            height: screenHeight * 0.15,
            aspectRatio: 16 / 9,
            viewportFraction: 0.33,
            initialPage: 0,
            enableInfiniteScroll: true,
            reverse: false,
            autoPlay: false,
            enlargeCenterPage: true,
            enlargeFactor: 0.4,
            scrollDirection: Axis.horizontal,
          ),
          items: avatarList.map((avatar) {
            return Builder(
              builder: (BuildContext context) {
                return InkWell(
                  onTap: () {
                    //Todo: pick Avatar
                  },
                  child: Image.asset(avatar, fit: BoxFit.contain),
                );
              },
            );
          }).toList(),
        ),
        Text('avatar'.tr(), style: AppStyles.white16RegularRoboto),
      ],
    );
  }
}
