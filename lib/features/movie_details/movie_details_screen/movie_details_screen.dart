import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:movies_app/core/di/di.dart';
import 'package:movies_app/core/utils/app_assets.dart';
import 'package:movies_app/core/utils/app_colors.dart';
import 'package:movies_app/core/utils/app_context.dart';
import 'package:movies_app/core/utils/app_styles.dart';
import 'package:movies_app/features/movie_details/cubit/movie_details_states.dart';
import 'package:movies_app/features/movie_details/cubit/movie_details_view_model.dart';
import 'package:movies_app/features/movie_details/movie_details_screen/widgets/custom_details_header.dart';
import 'package:movies_app/features/movie_suggestions/cubit/movie_suggestions_states.dart';
import 'package:movies_app/features/movie_suggestions/cubit/movie_suggestions_view_model.dart';
import 'package:movies_app/mvvm/views/ui/widgets/buttons/custom_elevated_button.dart';
import 'package:movies_app/mvvm/views/ui/widgets/custom_grid_view.dart';
import 'package:movies_app/mvvm/views/ui/widgets/details_screen_widget/movie_info_row.dart';
import 'package:movies_app/mvvm/views/ui/widgets/main_loading.dart';

import '../../../mvvm/views/ui/widgets/details_screen_widget/buildCastItem.dart';
import '../../../mvvm/views/ui/widgets/details_screen_widget/buildGenreChip.dart';

class MovieDetailsScreen extends StatefulWidget {
  const MovieDetailsScreen({super.key});

  @override
  State<MovieDetailsScreen> createState() => _MovieDetailsScreenState();
}

class _MovieDetailsScreenState extends State<MovieDetailsScreen> {
  late MovieDetailsViewModel movieDetailsViewModel;
  late MovieSuggestionsViewModel movieSuggestionsViewModel;

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    movieDetailsViewModel = getIt<MovieDetailsViewModel>();
    movieSuggestionsViewModel = getIt<MovieSuggestionsViewModel>();
  }

  @override
  void didChangeDependencies() {
    // TODO: implement didChangeDependencies
    super.didChangeDependencies();
    final int movieId = ModalRoute.of(context)!.settings.arguments as int;
    movieDetailsViewModel.fetchMovieDetails(movieId: movieId);
    movieSuggestionsViewModel.fetchMovieSuggestions(movieId: movieId);
  }

  @override
  Widget build(BuildContext context) {
    double screenHeight = context.screenHeight;
    double screenWidth = context.screenWidth;
    return BlocBuilder<MovieDetailsViewModel, MovieDetailsState>(
      bloc: movieDetailsViewModel,
      builder: (context, state) {
        if (state is MovieDetailsLoadingState) {
          return MainLoading();
        } else if (state is MovieDetailsErrorState) {
          return Text('error');
        } else if (state is MovieDetailsSuccessState) {
          var movie = state.movieDetails.data?.movie;
          return Scaffold(
            body: SingleChildScrollView(
              child: Stack(
                children: [
                  Image.network(
                    movie?.mediumCoverImage ?? '',
                    width: double.infinity,
                    fit: BoxFit.fill,
                  ),
                  Container(
                    height: screenHeight * 0.72,
                    decoration: BoxDecoration(
                      gradient: LinearGradient(
                        begin: Alignment.topCenter,
                        end: Alignment.bottomCenter,
                        colors: [Colors.transparent, AppColors.black],
                      ),
                    ),
                  ),
                  SafeArea(
                    child: CustomDetailsHeader(movieTitle: movie?.title),
                  ),
                  SizedBox(
                    height: screenHeight * 0.77,
                    child: Center(
                      child: GestureDetector(
                        onTap: () {
                          ScaffoldMessenger.of(context).showSnackBar(
                            SnackBar(
                              content: Text(
                                "Playing ${movie?.title} trailer...",
                              ),
                            ),
                          );
                        },
                        child: Image.asset(
                          AppAssets.playIcon,
                          width: screenWidth * 0.22,
                        ),
                      ),
                    ),
                  ),

                  Padding(
                    padding: EdgeInsets.symmetric(
                      horizontal: screenWidth * 0.04,
                    ),
                    child: Column(
                      spacing: screenHeight * 0.015,
                      crossAxisAlignment: .start,
                      children: [
                        SizedBox(height: screenHeight * 0.58),
                        Align(
                          alignment: .center,
                          child: Text(
                            movie?.title ?? '',
                            style: AppStyles.white24BoldRoboto,
                          ),
                        ),

                        Align(alignment: .center,
                          child: Text(
                              '${movie?.year}',
                              style: AppStyles.grey20BoldRoboto
                          ),
                        ),

                        CustomElevatedButton(
                          onPressed: () {},
                          backgroundColor: AppColors.red,
                          child: Text(
                            "Watch",
                            style: AppStyles.white20BoldRoboto,
                          ),
                        ),

                        // Stats Row
                        MovieInfoRow(movie: movie),

                        Text(
                          "screen_shots".tr(),
                          style: AppStyles.white24BoldRoboto,
                        ),
                        if (movie?.mediumScreenshotImage1 != null)
                          _buildNetworkImage(
                            movie!.mediumScreenshotImage1!,
                            context,
                          ),
                        if (movie?.mediumScreenshotImage2 != null)
                          _buildNetworkImage(
                            movie!.mediumScreenshotImage2!,
                            context,
                          ),
                        if (movie?.mediumScreenshotImage3 != null)
                          _buildNetworkImage(
                            movie!.mediumScreenshotImage3!,
                            context,
                          ),
                        Text(
                          "similar".tr(),
                          style: AppStyles.white24BoldRoboto,
                        ),

                        BlocBuilder<
                            MovieSuggestionsViewModel,
                            MovieSuggestionsStates
                        >(
                          bloc: movieSuggestionsViewModel,
                          builder: (context, state) {
                            if (state is MovieSuggestionsLoadingState) {
                              return MainLoading();
                            } else if (state is MovieSuggestionsErrorState) {
                              return Text('error');
                            } else if (state is MovieSuggestionsSuccessState) {
                              return CustomGridView(
                                movies: state.movieSuggestions.data?.movies,
                              );
                            } else {
                              return SizedBox();
                            }
                          },
                        ),
                        Text(
                          "summary".tr(),
                          style: AppStyles.white24BoldRoboto,
                        ),

                        Text(
                          movie?.descriptionIntro ?? '',
                          style: AppStyles.white16RegularRoboto,
                          textAlign: TextAlign.justify,
                        ),
                        Text("cast".tr(), style: AppStyles.white24BoldRoboto),

                        if (movie?.cast != null && movie!.cast!.isNotEmpty)
                          ListView.builder(
                            shrinkWrap: true,
                            padding: EdgeInsets.zero,
                            physics: const NeverScrollableScrollPhysics(),

                            itemCount: movie.cast!.length,
                            itemBuilder: (context, index) {
                              final actor = movie.cast![index];
                              return buildCastItem(
                                actor.urlSmallImage ?? '',
                                actor.name ?? 'Unknown',
                                actor.characterName ?? '',
                              );
                            },
                          ),
                        Text("genres".tr(), style: AppStyles.white24BoldRoboto),

                        Wrap(
                          spacing: 10,
                          runSpacing: 10,
                          children:
                          movie?.genres
                              ?.map((genre) => buildGenreChip(genre))
                              .toList() ??
                              [],
                        ),
                        SizedBox(height: screenHeight * 0.05),
                      ],
                    ),
                  ),
                ],
              ),
            ),
          );
        } else {
          return SizedBox();
        }
      },
    );
  }

  Widget _buildNetworkImage(String url, BuildContext context) {
    return Container(
      height: context.screenHeight * 0.2,
      width: double.infinity,
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(15),
        image: DecorationImage(image: NetworkImage(url), fit: BoxFit.cover),
      ),
    );
  }
}
