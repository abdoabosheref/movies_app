import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:carousel_slider/carousel_slider.dart';
import 'package:movies_app/core/utils/app_context.dart';
import 'package:movies_app/core/utils/app_styles.dart';

class CustomSlider extends StatelessWidget {

 final double viewportFraction ;
 final bool enlargeCenterPage ;
 final double enlargeFactor ;
 final List<Widget>? list ;
 final double height ;
 final String? underSliderText ;
 final dynamic Function(int, CarouselPageChangedReason)? onPageChanged ;


  const CustomSlider({super.key,
    required this.viewportFraction,
    required this.enlargeCenterPage,
    this.enlargeFactor = 0,
    required this.height,
    required this.list,
    this.underSliderText ,
    this.onPageChanged,
  });

  @override
  Widget build(BuildContext context) {
    double screenHeight = context.screenHeight;
    return Column(
      mainAxisSize: .min,
      spacing: screenHeight * 0.003,
      children: [
        CarouselSlider(
          options: CarouselOptions(
            onPageChanged: onPageChanged,
            height: height,
            aspectRatio: 16 / 9,
            viewportFraction: viewportFraction,
            enableInfiniteScroll: true,
            reverse: true,
            enlargeCenterPage: enlargeCenterPage,
            enlargeFactor: enlargeFactor ,
            scrollDirection: Axis.horizontal,
          ),
          items: list
        ),

         underSliderText == null ? SizedBox() :
             Text(underSliderText!.tr(),style: AppStyles.white16RegularRoboto,) ,
      ],
    );
  }
}
