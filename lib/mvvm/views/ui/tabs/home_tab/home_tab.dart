import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:movies_app/core/utils/app_assets.dart';
import 'package:movies_app/core/utils/app_context.dart';
import 'package:movies_app/core/utils/app_styles.dart';
import 'package:movies_app/mvvm/views/ui/widgets/buttons/custom_text_button.dart';
import 'package:movies_app/mvvm/views/ui/widgets/custom_movie_poster.dart';
import 'package:movies_app/mvvm/views/ui/widgets/custom_slider.dart';

class HomeTab extends StatelessWidget {
  HomeTab({super.key});
  final List<String> availableNowList = [
    AppAssets.onBoarding1,
    AppAssets.onBoarding2,
    AppAssets.onBoarding3,
    AppAssets.onBoarding4,
    AppAssets.onBoarding5,
    AppAssets.onBoarding6,
  ];  //for testing
  final List<String> watchNowList = [
    AppAssets.onBoarding1,
    AppAssets.onBoarding2,
    AppAssets.onBoarding3,
    AppAssets.onBoarding4,
    AppAssets.onBoarding5,
    AppAssets.onBoarding6,
  ];      //for testing

  @override
  Widget build(BuildContext context) {
    double screenWidth = context.screenWidth;
    double screenHeight = context.screenHeight;

    return Scaffold(
      body: Stack(
        children: [
          SizedBox(
            height: screenHeight * 0.8,
            width: screenWidth * 1,
            child: Image.asset(AppAssets.homeTabBackGround, fit: BoxFit.fill),
          ),
          Container(
            width: screenWidth * 1,
            height: screenHeight * 0.8,
            decoration: linerDecoration(),
          ),

          SingleChildScrollView(
            child: SafeArea(
              child: Column(
                spacing: screenHeight * 0.03,
                children: [
                  Column(
                    spacing: screenHeight * 0.02,
                    children: [
                      Image.asset(AppAssets.availableNowImage),
                      CustomSlider(
                        viewportFraction: 0.54,
                        height: screenHeight * 0.37,
                        enableInfiniteScroll: false,
                        enlargeCenterPage: true,
                        enlargeFactor: 0.3,
                        list: availableNowList.map((availableNow) {
                          return Builder(
                            builder: (BuildContext context) {
                              return GestureDetector(
                                onTap: () {
                                  //Todo: navigate to movie details
                                },
                                child: CustomMoviePoster(
                                  rating: '7.7',
                                  width: screenWidth * 0.5,
                                  height: screenHeight * 0.3,
                                  imageString: availableNow,
                                ),
                              );
                            },
                          );
                        }).toList(),
                      ),
                      Image.asset(AppAssets.watchNowImage),
                    ],
                  ),

                  Padding(
                    padding: EdgeInsets.symmetric(
                      horizontal: screenWidth * 0.03,
                    ),
                    child: Column(
                      children: [
                        Row(
                          mainAxisAlignment: .spaceBetween,
                          children: [
                            Text(
                              'Action', //Todo: randomly changes every time
                              //Todo: user go to any screen and back to home tab
                              style: AppStyles.white20RegularRoboto,
                            ),
                            Row(
                              children: [
                                CustomTextButton(
                                  onPressed: () {
                                    //todo: navigate to browse tab using bloc by changing the index
                                  },
                                  text: 'see_more'.tr(),
                                  textStyle: AppStyles.yellow16RegularRoboto,
                                ),
                              ],
                            ),
                          ],
                        ),
                        CustomSlider(
                          viewportFraction: 0.39,
                          enableInfiniteScroll: false,
                          enlargeCenterPage: false,
                          enlargeFactor: 0.4,
                          height: screenHeight * 0.23,
                          list: watchNowList.map((watchNow) {
                            return Builder(
                              builder: (BuildContext context) {
                                return GestureDetector(
                                  onTap: () {
                                    //Todo: navigate to movie details
                                  },
                                  child: CustomMoviePoster(
                                    rating: '7.7',
                                    width: screenWidth * 0.33,
                                    height: screenHeight * 0.23,
                                    imageString: watchNow,
                                  ),
                                );
                              },
                            );
                          }).toList(),
                        ),
                      ],
                    ),
                  ),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }

  Decoration linerDecoration() {
    return BoxDecoration(
      gradient: LinearGradient(
        begin: Alignment.topCenter,
        end: Alignment.bottomCenter,
        stops: const [0.0, 0.40, 1.0],
        colors: [
          Color(0xFF121312).withValues(alpha: 0.5),
          Color(0xFF121312).withValues(alpha: 0.7),
          Color(0xFF121312).withValues(alpha: 1.0),
        ],
      ),
    );
  }
}
