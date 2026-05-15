import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:movies_app/core/utils/app_assets.dart';
import 'package:movies_app/core/utils/app_colors.dart';
import 'package:movies_app/core/utils/app_context.dart';
import 'package:movies_app/core/utils/app_styles.dart';
import 'package:movies_app/core/utils/app_lists.dart';
import 'package:movies_app/core/utils/app_routes.dart';
import 'package:movies_app/mvvm/views/ui/widgets/buttons/custom_text_button.dart';
import 'package:movies_app/mvvm/views/ui/widgets/custom_movie_poster.dart';
import 'package:movies_app/mvvm/views/ui/widgets/custom_slider.dart';

import '../../widgets/buttons/see_more_text_button.dart';

class HomeTab extends StatelessWidget {
  HomeTab({super.key});

  @override
  Widget build(BuildContext context) {
    double screenWidth = context.screenWidth;
    double screenHeight = context.screenHeight;

    return SafeArea(
      bottom: false,
      child: Scaffold(
        body: Stack(
          children: [
            SizedBox(
              child: Image.asset(AppAssets.homeTabBackGround),
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
                    CustomSlider(
                      viewportFraction: 0.45,
                      height: screenHeight * 0.35,
                      enlargeCenterPage: true,
                      enlargeFactor: 0.28,
                      list: AppLists.dummyMovies.map((movie) {
                        return Builder(
                          builder: (BuildContext context) {
                            return GestureDetector(
                              onTap: () {
                                Navigator.pushNamed(
                                  context,
                                  AppRoutes.movieDetailsScreen,
                                  arguments: movie,
                                );
                              },
                              child: CustomMoviePoster(
                                rating: movie.rating,
                                imageString: movie.image,
                              ),
                            );
                          },
                        );
                      }).toList(),
                    ),
                    SizedBox(height: screenHeight * 0.02),
                    Padding(
                      padding: EdgeInsets.symmetric(
                        horizontal: screenWidth * 0.08,
                      ),
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
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Text(
                            'Action',
                            style: AppStyles.white20RegularRoboto,
                          ),
                          SeeMoreTextButton(onPressed: () {})
                        ],
                      ),
                      CustomSlider(
                        viewportFraction: 0.42,
                        enlargeFactor: 0.0,
                        enlargeCenterPage: false,
                        height: screenHeight * 0.23,
                        list: AppLists.dummyMovies.map((movie) {
                          return Builder(
                            builder: (BuildContext context) {
                              return GestureDetector(
                                onTap: () {
                                  Navigator.pushNamed(
                                    context,
                                    AppRoutes.movieDetailsScreen,
                                    arguments: movie,
                                  );
                                },
                                child: Padding(
                                  padding: EdgeInsets.symmetric(
                                      horizontal: screenWidth * 0.02),
                                  child: CustomMoviePoster(
                                    rating: movie.rating,
                                    imageString: movie.image,
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
          AppColors.blackOpacity50,
          AppColors.blackOpacity70,
          AppColors.black,
        ],
      ),
    );
  }
}
