import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:movies_app/core/utils/app_assets.dart';
import 'package:movies_app/core/utils/app_colors.dart';
import 'package:movies_app/core/utils/app_context.dart';
import 'package:movies_app/core/utils/app_styles.dart';
import 'package:movies_app/mvvm/views/ui/widgets/buttons/custom_text_button.dart';
import 'package:movies_app/mvvm/views/ui/widgets/custom_movie_poster.dart';
import 'package:movies_app/mvvm/views/ui/widgets/custom_slider.dart';

class HomeTab extends StatelessWidget {
  HomeTab({super.key});
  final List<String> currentAvailableNowItem = [
    AppAssets.onBoarding1,
    AppAssets.onBoarding2,
    AppAssets.onBoarding3,
    AppAssets.onBoarding4,
    AppAssets.onBoarding5,
    AppAssets.onBoarding6,
  ];  //for testing
  final List<String> currentWatchNowItem = [
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

    return SafeArea(bottom: false,
      child: Scaffold(
        body: Stack(
          children: [
            SizedBox(
              //todo : change background image according to slider using bloc
              child: Image.asset(AppAssets.homeTabBackGround,),
            ),
            Container(
              decoration: linerDecoration(),
            ),
      
            ListView(
              children: [
                Column(
                  children: [
                    Padding(
                      padding: EdgeInsets.symmetric(horizontal: screenWidth * 0.19),
                      child: Image.asset(AppAssets.availableNowImage),
                    ),
                    SizedBox(height: screenHeight * 0.02),
                    CustomSlider(//sized box
                      viewportFraction: 0.45,
                      height: screenHeight * 0.35,
                      enlargeCenterPage: true,
                      enlargeFactor: 0.28,
                      list: currentAvailableNowItem.map((availableNow) {
                        return Builder(
                          builder: (BuildContext context) {
                            return GestureDetector(
                              onTap: () {
                                //Todo: navigate to movie details
                              },
                              child: CustomMoviePoster(
                                rating: '7.7',
                                imageString: availableNow,
                              ),
                            );
                          },
                        );
                      }).toList(),
                    ),
                    SizedBox(height: screenHeight * 0.02),
                    Padding(
                      padding: EdgeInsets.symmetric(
                        horizontal: screenWidth * 0.08,),
                      child: Image.asset(AppAssets.watchNowImage),
                    ),
                  ],
                ),
                SizedBox(height: screenHeight * 0.03),
                Padding(
                  padding: EdgeInsets.symmetric(
                    horizontal: screenWidth * 0.04,
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
                          CustomTextButton(
                            onPressed: () {
                              //todo: navigate to browse tab using bloc by changing the index
                            },
                            text: Row(spacing: screenWidth * 0.01,
                              children: [
                                Text('see_more'.tr(),style: AppStyles.yellow16RegularRoboto,),
                                Icon(Icons.arrow_forward_sharp,color: AppColors.yellow,size: 18,)
                              ],
                            ),
                            textStyle: AppStyles.yellow16RegularRoboto,
                          ),
                        ],
                      ),
                      CustomSlider(
                        viewportFraction: 0.42,
                        enlargeFactor: 0.0,
                        enlargeCenterPage: false,
                        height: screenHeight * 0.23,
                        list: currentWatchNowItem.map((watchNow) {
                          return Builder(
                            builder: (BuildContext context) {
                              return GestureDetector(
                                onTap: () {
                                  //Todo: navigate to movie details
                                },
                                child: Padding(
                                  padding: EdgeInsets.symmetric(
                                      horizontal:screenWidth*0.02),
                                  child: CustomMoviePoster(
                                    rating: '7.7',
                                    imageString: watchNow,
                                  ),
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
          ],
        ),
      ),
    );
  }

  Decoration linerDecoration() {
    return BoxDecoration(
      gradient: LinearGradient(
        begin: Alignment.topCenter,
        end: Alignment.bottomCenter,
        stops: const [0.0, 0.48, 0.6],
        colors: [
          AppColors.blackOpacity05,
          AppColors.blackOpacity07,
          AppColors.blackOpacity1,
        ],
      ),
    );
  }
}
