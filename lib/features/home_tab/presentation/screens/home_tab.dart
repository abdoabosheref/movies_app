import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:movies_app/core/utils/app_assets.dart';
import 'package:movies_app/core/utils/app_colors.dart';
import 'package:movies_app/core/utils/app_context.dart';
import 'package:movies_app/core/utils/app_styles.dart';
import 'package:movies_app/features/home_tab/presentation/cubit/home_tab_cubit.dart';
import 'package:movies_app/features/home_tab/presentation/cubit/home_tab_state.dart';
import 'package:movies_app/features/home_tab/presentation/widgets/see_more_text_button.dart';
import 'package:movies_app/mvvm/views/ui/widgets/custom_movie_poster.dart';
import 'package:movies_app/mvvm/views/ui/widgets/custom_slider.dart';
import 'package:movies_app/mvvm/views/ui/widgets/custom_toast.dart';
import 'package:movies_app/mvvm/views/ui/widgets/main_loading.dart';

class HomeTab extends StatelessWidget {
  const HomeTab({super.key});

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
              width: screenWidth,
              height: screenHeight,
              child: Image.asset(
                AppAssets.homeTabBackGround,
                fit: BoxFit.cover,
              ),
            ),
            Container(decoration: linerDecoration()),

            BlocConsumer<HomeTabCubit, HomeTabState>(
              listener: (context, state) {
                if (state is HomeErrorState) {
                  CustomToast.showErrorToast(context, state.errorMessage);
                }
                if (state is HomeSuccessState) {
                  CustomToast.showSuccessToast(context, 'Movies Loaded Successfully');
                }
              },
              builder: (context, state) {
                if (state is HomeLoadingState) {
                  return const Center(child: MainLoading());
                }

                if (state is HomeErrorState) {
                  return Center(
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Text(
                          state.errorMessage,
                          style: AppStyles.white20RegularRoboto,
                          textAlign: TextAlign.center,
                        ),
                        const SizedBox(height: 16),
                        ElevatedButton(
                          onPressed: () => context.read<HomeTabCubit>().loadHomeTabData(),
                          child: const Text('Try Again'),
                        ),
                      ],
                    ),
                  );
                }

                if (state is HomeSuccessState) {
                  if (state.movies.isEmpty) {
                    return const Center(child: Text('No Movies Available', style: TextStyle(color: Colors.white)));
                  }

                  return ListView(
                    physics: const BouncingScrollPhysics(),
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

                          CustomSlider(
                            viewportFraction: 0.45,
                            height: screenHeight * 0.35,
                            enlargeCenterPage: true,
                            enlargeFactor: 0.28,
                            list: state.movies.map((availableNow) {
                              return GestureDetector(
                                onTap: () {
                                  //Todo: navigate to movie details
                                },
                                child: CustomMoviePoster(
                                  rating: availableNow.rating.toString(),
                                  imageString: availableNow.mediumCoverImage ?? '',
                                ),
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
                        padding: EdgeInsets.symmetric(horizontal: screenWidth * 0.04),
                        child: Column(
                          children: [
                            Row(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: [
                                Text(
                                  state.genreShuffle,
                                  style: AppStyles.white20RegularRoboto,
                                ),
                                SeeMoreTextButton(onPressed: () {}),
                              ],
                            ),

                            CustomSlider(
                              viewportFraction: 0.42,
                              enlargeFactor: 0.0,
                              enlargeCenterPage: false,
                              height: screenHeight * 0.23,
                              list: state.moviesByGenre.map((watchNow) {
                                return Padding(
                                  padding: EdgeInsets.symmetric(
                                    horizontal: screenWidth * 0.02,
                                  ),
                                  child: GestureDetector(
                                    onTap: () {
                                      //Todo: navigate to movie details
                                    },
                                    child: CustomMoviePoster(
                                      rating: watchNow.rating.toString(),
                                      imageString: watchNow.mediumCoverImage ?? '',
                                    ),
                                  ),
                                );
                              }).toList(),
                            ),
                          ],
                        ),
                      ),
                    ],
                  );
                }

                return const SizedBox.shrink();
              },
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