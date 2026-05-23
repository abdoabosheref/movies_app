import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:movies_app/core/utils/app_colors.dart';
import 'package:movies_app/core/utils/app_context.dart';
import 'package:movies_app/core/utils/app_styles.dart';
import 'package:movies_app/features/tabs/browse_tab/cubit/browse_tab_states.dart';
import 'package:movies_app/features/tabs/browse_tab/cubit/browse_tab_view_model.dart';
import 'package:movies_app/features/tabs/home_tab/data/models/movies_genre.dart';

class HorizontalListView extends StatelessWidget {
  const HorizontalListView({super.key});

  final moviesGenreList = MoviesGenre.moviesGenreList;

  @override
  Widget build(BuildContext context) {
    double screenHeight = context.screenHeight;
    double screenWidth = context.screenWidth;
    final browseTabViewModel = context.read<BrowseTabViewModel>();
    return SizedBox(
      height: screenHeight*0.064,
      child: BlocBuilder<BrowseTabViewModel, BrowseTabStates>(
        buildWhen: (previous, current) =>
            current is BrowseTabSuccessState ||
            current is BrowseTabChangeSelectedIndexState,
        builder: (context, state) {
          return ListView.builder(
            itemCount: moviesGenreList.length,
            scrollDirection: Axis.horizontal,
            itemBuilder: (context, index) {
              return AnimatedContainer(
                duration: const Duration(milliseconds: 200),
                padding:  EdgeInsets.symmetric(
                  horizontal: screenWidth*0.04,
                  vertical: screenHeight*0.01,
                ),
                margin: EdgeInsets.only(left: screenWidth*0.03),
                decoration: BoxDecoration(
                  color: browseTabViewModel.isSelected(currentIndex: index)
                      ? AppColors.yellow
                      : AppColors.transparent,
                  borderRadius: BorderRadius.circular(16),
                  border: Border.all(color: AppColors.yellow, width: 2),
                ),
                child: InkWell(
                  onTap: () {
                    browseTabViewModel.changeSelectedIndex(currentIndex: index);
                    browseTabViewModel.getMoviesList(
                      genre: moviesGenreList[index],
                    );
                  },
                  child: Text(
                    moviesGenreList[index],
                    style: browseTabViewModel.isSelected(currentIndex: index)
                        ? AppStyles.darkBlack20BoldInter
                        : AppStyles.yellow20BoldInter,
                  ),
                ),
              );
            },
          );
        },
      ),
    );
  }
}
