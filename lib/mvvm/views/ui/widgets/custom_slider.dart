import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:carousel_slider/carousel_slider.dart';
import 'package:movies_app/core/utils/app_assets.dart';
import 'package:movies_app/core/utils/app_context.dart';
import 'package:movies_app/core/utils/app_styles.dart';

class CustomSlider extends StatelessWidget {

 final double viewportFraction ;
 final bool enableInfiniteScroll ;
 final bool enlargeCenterPage ;
 final double enlargeFactor ;
 final List<Widget>? list ;
 final double height ;

  const CustomSlider({super.key,
    required this.viewportFraction,
    required this.enableInfiniteScroll,
    required this.enlargeCenterPage,
    required this.enlargeFactor,
    required this.height,
    required this.list});

  @override
  Widget build(BuildContext context) {
    double screenHeight = context.screenHeight;
    return Column(
      mainAxisSize: .min,
      spacing: screenHeight * 0.003,
      children: [
        CarouselSlider(
          options: CarouselOptions(
            height: height,
            aspectRatio: 16 / 9,
            viewportFraction: viewportFraction,
            initialPage:4,
            enableInfiniteScroll: enableInfiniteScroll,
            reverse: false,
            autoPlay: false,
            enlargeCenterPage: enlargeCenterPage,
            enlargeFactor:enlargeFactor,
            scrollDirection: Axis.horizontal,
          ),
          items: list
        ),
        // Text('Avatar'.tr(),style: AppStyles.white14RegularRoboto,),
      ],
    );
  }
}
