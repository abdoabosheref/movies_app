import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:movies_app/core/di/di.dart';
import 'package:movies_app/core/utils/app_colors.dart';
import 'package:movies_app/core/utils/app_context.dart';
import 'package:movies_app/core/utils/app_styles.dart';
import 'package:movies_app/domain/entities/movie_response/movie.dart';
import 'package:movies_app/features/screens/movie_details/movie_details_screen/widgets/cast_list_view.dart';
import 'package:movies_app/features/screens/movie_details/movie_details_screen/widgets/custom_details_header.dart';
import 'package:movies_app/features/screens/movie_details/movie_details_screen/widgets/custom_linear_gradient.dart';
import 'package:movies_app/features/screens/movie_details/movie_details_screen/widgets/custom_play_button.dart';
import 'package:movies_app/features/screens/movie_details/movie_details_screen/widgets/genre_chip.dart';
import 'package:movies_app/features/screens/movie_details/movie_details_screen/widgets/movie_info_row.dart';
import 'package:movies_app/features/tabs/profile_tab/cubit/history/history_view_model.dart';
import 'package:url_launcher/url_launcher.dart';

import '../../../tabs/profile_tab/cubit/watchlist_view_model.dart';
import '../../../widgets/buttons/custom_elevated_button.dart';
import '../../../widgets/custom_cached_network_image.dart';
import '../../../widgets/custom_error_column.dart';
import '../../../widgets/custom_grid_view.dart';
import '../../../widgets/main_loading.dart';
import '../../movie_suggestions/cubit/movie_suggestions_states.dart';
import '../../movie_suggestions/cubit/movie_suggestions_view_model.dart';
import '../cubit/movie_details_states.dart';
import '../cubit/movie_details_view_model.dart';

class MovieDetailsScreen extends StatefulWidget {
  const MovieDetailsScreen({super.key});

  @override
  State<MovieDetailsScreen> createState() => _MovieDetailsScreenState();
}

class _MovieDetailsScreenState extends State<MovieDetailsScreen> {
  late int movieId;
  late MovieDetailsViewModel movieDetailsViewModel;
  late MovieSuggestionsViewModel movieSuggestionsViewModel;
  bool isMovieAddedToHistory = false;
  late WatchlistViewModel watchlistViewModel;

  @override
  void initState() {
    super.initState();
    movieDetailsViewModel = getIt<MovieDetailsViewModel>();
    movieSuggestionsViewModel = getIt<MovieSuggestionsViewModel>();

    watchlistViewModel = getIt<WatchlistViewModel>();
  }

  @override
  void didChangeDependencies() {
    super.didChangeDependencies();
    movieId = ModalRoute.of(context)!.settings.arguments as int;
    callMovieDetails();
  }

  @override
  Widget build(BuildContext context) {
    double screenHeight = context.screenHeight;
    double screenWidth = context.screenWidth;
    return Scaffold(
      body: BlocBuilder<MovieDetailsViewModel, MovieDetailsState>(
        bloc: movieDetailsViewModel,
        builder: (context, state) {
          if (state is MovieDetailsLoadingState) {
            return MainLoading();
          } else if (state is MovieDetailsErrorState) {
            return CustomErrorColumn(
              errorMessage: state.appException.message,
              onPressed: () => callMovieDetails(),
            );
          } else if (state is MovieDetailsSuccessState) {
            var movie = state.movieDetails.data?.movie;
            if (!isMovieAddedToHistory && movie != null) {
              isMovieAddedToHistory = true;

              final currentMovie = Movie(
                id: movie.id,
                mediumCoverImage: movie.mediumCoverImage,
                rating: (movie.rating as num?)?.toDouble(),
              );

              WidgetsBinding.instance.addPostFrameCallback((_) {
                getIt<HistoryViewModel>().addMovieToHistory(movie: currentMovie);
              });
            }
            return SingleChildScrollView(
              child: Stack(
                children: [
                  CustomCachedNetworkImage(
                    imageString: movie?.mediumCoverImage ?? '',
                    isBackground: true,
                  ),
                  CustomLinearGradient(),
                  SafeArea(
                    child: CustomDetailsHeader(
                      movieId: movie?.id,
                      movieImage: movie?.mediumCoverImage,
                      movieTitle: movie?.title,
                      movieRating: movie?.rating,
                      watchlistViewModel: watchlistViewModel,
                    ),
                  ),
                  CustomPlayButton(movieTitle: movie?.title ?? ''),
                  Padding(
                    padding: EdgeInsets.symmetric(
                      horizontal: screenWidth * 0.04,
                    ),
                    child: Column(
                      spacing: screenHeight * 0.015,
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        SizedBox(height: screenHeight * 0.58),
                        Align(
                          alignment: Alignment.center,
                          child: Text(
                            movie?.title ?? '',
                            style: AppStyles.white24BoldRoboto,
                          ),
                        ),
                        Align(
                          alignment: Alignment.center,
                          child: Text(
                            '${movie?.year}',
                            style: AppStyles.grey20BoldRoboto,
                          ),
                        ),
                        CustomElevatedButton(
                          onPressed: () async{
                            if (movie != null) {
                              watchlistViewModel.addMovieToWatchlist(
                                movieId: movie.id!,
                                title: movie.title ?? '',
                                imageUrl: movie.mediumCoverImage ?? '',
                                rating: movie.rating ?? 0.0,
                              );
                              final Uri url = Uri.parse(movie.url??'');
                              await launchUrl(url,mode: LaunchMode.inAppBrowserView);

                              ScaffoldMessenger.of(context).showSnackBar(
                                SnackBar(
                                  content: Text(
                                    "${movie.title} added to Watchlist!",
                                  ),
                                ),
                              );
                            }
                          },
                          backgroundColor: AppColors.red,
                          child: Text(
                            "Watch",
                            style: AppStyles.white20BoldRoboto,
                          ),
                        ),

                        MovieInfoRow(movie: movie),

                        Text(
                          "screen_shots".tr(),
                          style: AppStyles.white24BoldRoboto,
                        ),
                        if (movie?.mediumScreenshotImage1 != null)
                          CustomCachedNetworkImage(
                            imageString: movie!.mediumScreenshotImage1!,
                          ),
                        if (movie?.mediumScreenshotImage2 != null)
                          CustomCachedNetworkImage(
                            imageString: movie!.mediumScreenshotImage2!,
                          ),
                        if (movie?.mediumScreenshotImage3 != null)
                          CustomCachedNetworkImage(
                            imageString: movie!.mediumScreenshotImage3!,
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
                                isScrollable: false,
                                movies: state.movieResponse.data?.movies,
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
                          movie?.descriptionIntro ?? 'No Summary available',
                          style: AppStyles.white16RegularRoboto,
                        ),
                        Text("cast".tr(), style: AppStyles.white24BoldRoboto),
                        (movie?.cast != null && movie!.cast!.isNotEmpty)
                            ? CastListView(castList: movie.cast!)
                            : Text(
                          'No Cast available',
                          style: AppStyles.white16RegularRoboto,
                        ),
                        Text("genres".tr(), style: AppStyles.white24BoldRoboto),
                        Wrap(
                          spacing: 10,
                          runSpacing: 10,
                          children:
                          movie?.genres
                              ?.map(
                                (genreLabel) =>
                                GenreChip(genreLabel: genreLabel),
                          )
                              .toList() ??
                              [],
                        ),
                        SizedBox(height: screenHeight * 0.05),
                      ],
                    ),
                  ),
                ],
              ),
            );
          } else {
            return SizedBox();
          }
        },
      ),
    );
  }

  void callMovieDetails() {
    movieDetailsViewModel.fetchMovieDetails(movieId: movieId);
    movieSuggestionsViewModel.fetchMovieSuggestions(movieId: movieId);
    watchlistViewModel.checkMovieWatchlistStatus(movieId);
  }
}