import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_svg/svg.dart';
import 'package:movies_app/core/utils/app_assets.dart';
import 'package:movies_app/core/utils/app_colors.dart';
import 'package:movies_app/features/widgets/custom_toast.dart';

import '../../../../../core/utils/app_context.dart';
import '../../../../tabs/profile_tab/cubit/watchlist_states.dart';
import '../../../../tabs/profile_tab/cubit/watchlist_view_model.dart';

class CustomDetailsHeader extends StatelessWidget {
  final int? movieId;
  final String? movieTitle;
  final String? movieImage;
  final double? movieRating;
  final WatchlistViewModel watchlistViewModel;

  const CustomDetailsHeader({
    super.key,
    this.movieId,
    this.movieTitle,
    this.movieImage,
    this.movieRating,
    required this.watchlistViewModel,
  });

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.symmetric(
        horizontal: context.screenWidth * 0.02,
        vertical: context.screenHeight * 0.007,
      ),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          IconButton(
            onPressed: () => Navigator.pop(context),
            icon: Icon(
              Icons.arrow_back_ios_rounded,
              color: AppColors.white,
              size: 32,
            ),
          ),

          BlocBuilder<WatchlistViewModel, WatchlistStates>(
            bloc: watchlistViewModel,
            builder: (context, state) {
              bool isSaved = false;

              if (state is WatchlistSavedStatusState) {
                isSaved = state.isSaved;
              }

              return IconButton(
                onPressed: () {
                  if (movieId != null) {
                    watchlistViewModel.toggleMovieWatchlist(
                      movieId: movieId!,
                      title: movieTitle ?? '',
                      imageUrl: movieImage ?? '',
                      rating: movieRating ?? 0.0,
                      isCurrentlySaved: isSaved,
                    );
                    !isSaved
                        ? CustomToast.showSuccessToast(
                            context,
                            "Added $movieTitle to Watchlist",
                          )
                        : CustomToast.showErrorToast(
                            context,
                            "Removed $movieTitle from Watchlist",
                          );
                  }
                },
                icon: SvgPicture.asset(
                  AppAssets.bookMark,
                  colorFilter: ColorFilter.mode(
                    isSaved ? AppColors.yellow : AppColors.white,
                    BlendMode.srcIn,
                  ),
                ),
              );
            },
          ),
        ],
      ),
    );
  }
}
