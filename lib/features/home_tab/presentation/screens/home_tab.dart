import 'package:flutter/material.dart';
import 'package:movies_app/api_dio/dio_manager.dart';
import 'package:movies_app/core/utils/app_assets.dart';
import 'package:movies_app/core/utils/app_colors.dart';
import 'package:movies_app/core/utils/app_context.dart';
import 'package:movies_app/core/utils/app_styles.dart';
import 'package:movies_app/features/home_tab/data/models/movies_genre.dart';
import 'package:movies_app/features/home_tab/presentation/widgets/see_more_text_button.dart';
import 'package:movies_app/mvvm/views/ui/widgets/custom_movie_poster.dart';
import 'package:movies_app/mvvm/views/ui/widgets/custom_slider.dart';
import 'package:movies_app/mvvm/views/ui/widgets/custom_toast.dart';
import 'package:movies_app/mvvm/views/ui/widgets/main_loading.dart';

class HomeTab extends StatelessWidget {
  const HomeTab({super.key});

  @override
  Widget build(BuildContext context) {
    final String genreShuffle = MoviesGenre.shuffleGenre();
    double screenWidth = context.screenWidth;
    double screenHeight = context.screenHeight;

    return SafeArea(
      bottom: false,
      child: Scaffold(
        body: Stack(
          children: [
            SizedBox(
              //todo : change background image according to slider using bloc
              child: Image.asset(AppAssets.homeTabBackGround),
            ),
            Container(decoration: linerDecoration()),

            ListView(
              children: [
                Column(
                  children: [
                    Padding(
                      padding: EdgeInsets.symmetric(
                        horizontal: screenWidth * 0.19,
                      ),
                      child: Image.asset(AppAssets.availableNowImage),
                    ),
                    SizedBox(height: screenHeight * 0.02),
                    FutureBuilder(
                      future: DioManager.getMoviesList(),
                      builder: (context, snapshot) {
                        if (snapshot.connectionState ==
                            ConnectionState.waiting) {
                          return MainLoading();
                        }
                        if (snapshot.hasError) {
                          WidgetsBinding.instance.addPostFrameCallback((_) {
                            CustomToast.showErrorToast(
                              context,
                              snapshot.error.toString(),
                            );
                          });
                          return Text('something went wrong');
                        }
                        if (snapshot.data?.status != 'ok') {
                          WidgetsBinding.instance.addPostFrameCallback((_) {
                            CustomToast.showErrorToast(
                              context,
                              snapshot.error.toString(),
                            );
                          });
                          return Text('something went wrong');
                        } else {
                          final movies = snapshot.data!.data!.movies!;
                          return CustomSlider(
                            viewportFraction: 0.45,
                            height: screenHeight * 0.35,
                            enlargeCenterPage: true,
                            enlargeFactor: 0.28,
                            list: movies.map((availableNow) {
                              return Builder(
                                builder: (BuildContext context) {
                                  return GestureDetector(
                                    child: CustomMoviePoster(
                                      rating: availableNow.rating.toString(),
                                      imageString:
                                          availableNow.mediumCoverImage ??
                                          'no image',
                                    ),
                                    onTap: () {
                                      //Todo: navigate to movie details},
                                    },
                                  );
                                },
                              );
                            }).toList(),
                          );
                        }
                      },
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
                  padding: EdgeInsets.symmetric(horizontal: screenWidth * 0.04),
                  child: Column(
                    children: [
                      Row(
                        mainAxisAlignment: .spaceBetween,
                        children: [
                          Text(
                            genreShuffle, // randomly changes every time
                            // user go to any screen and back to home tab
                            style: AppStyles.white20RegularRoboto,
                          ),
                          SeeMoreTextButton(onPressed: () {}),
                        ],
                      ),
                      FutureBuilder(
                        future: DioManager.getMoviesListByGenre(genreShuffle),
                        builder: (context, snapshot) {
                          if (snapshot.connectionState ==
                              ConnectionState.waiting) {
                            return MainLoading();
                          }
                          if (snapshot.hasError) {
                            WidgetsBinding.instance.addPostFrameCallback((_) {
                              CustomToast.showErrorToast(
                                context,
                                snapshot.error.toString(),
                              );
                            });
                            return Text('something went wrong');
                          }
                          if (snapshot.data?.status != 'ok') {
                            WidgetsBinding.instance.addPostFrameCallback((_) {
                              CustomToast.showErrorToast(
                                context,
                                snapshot.error.toString(),
                              );
                            });
                            return Text('something went wrong');
                          } else {
                           final  moviesByGenre = snapshot.data!.data!.movies!;
                            return CustomSlider(
                              viewportFraction: 0.42,
                              enlargeFactor: 0.0,
                              enlargeCenterPage: false,
                              height: screenHeight * 0.23,
                              list: moviesByGenre.map((watchNow) {
                                return Builder(
                                  builder: (BuildContext context) {
                                    return GestureDetector(
                                      onTap: () {
                                        //Todo: navigate to movie details
                                      },
                                      child: Padding(
                                        padding: EdgeInsets.symmetric(
                                          horizontal: screenWidth * 0.02,
                                        ),
                                        child: CustomMoviePoster(
                                          rating: watchNow.rating.toString(),
                                          imageString: watchNow.mediumCoverImage ??
                                          'no image',
                                        ),
                                      ),
                                    );
                                  },
                                );
                              }).toList(),
                            );
                          }
                        },
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
