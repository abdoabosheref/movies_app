import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:movies_app/core/di/di.dart';
import 'package:movies_app/core/utils/app_context.dart';
import 'package:movies_app/features/tabs/browse_tab/cubit/browse_tab_states.dart';
import 'package:movies_app/features/tabs/browse_tab/cubit/browse_tab_view_model.dart';
import 'package:movies_app/features/tabs/browse_tab/widgets/horizontal_list_view.dart';
import 'package:movies_app/features/tabs/home_tab/data/models/movies_genre.dart';
import 'package:movies_app/features/widgets/custom_error_column.dart';
import 'package:movies_app/features/widgets/custom_grid_view.dart';
import 'package:movies_app/features/widgets/main_loading.dart';

class BrowseTab extends StatefulWidget {
  const BrowseTab({super.key});

  @override
  State<BrowseTab> createState() => _BrowseTabState();
}

class _BrowseTabState extends State<BrowseTab> {
  BrowseTabViewModel browseTabViewModel = getIt<BrowseTabViewModel>();
  final moviesGenreList = MoviesGenre.moviesGenreList;

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    browseTabViewModel.getMoviesList(genre: moviesGenreList[0]);
  }

  @override
  Widget build(BuildContext context) {
    double screenHeight = context.screenHeight;
    double screenWidth = context.screenWidth;
    return SafeArea(
      bottom: false,
      child: Column(
        spacing: screenHeight * 0.02,
        children: [
          BlocProvider.value(
            value: browseTabViewModel,
            child: HorizontalListView(),
          ),
          Expanded(
            child: BlocBuilder<BrowseTabViewModel, BrowseTabStates>(
              bloc: browseTabViewModel,
              buildWhen: (previous, current) =>
              current is! BrowseTabChangeSelectedIndexState,
              builder: (context, state) {
                if (state is BrowseTabLoadingState) {
                  return MainLoading();
                } else if (state is BrowseTabErrorState) {
                  return CustomErrorColumn(
                    onPressed: () =>
                        browseTabViewModel.getMoviesList(
                          genre:
                          moviesGenreList[browseTabViewModel.selectedIndex],
                        ),
                    errorMessage: state.appException.message,
                  );
                }
                return Padding(
                  padding:  EdgeInsets.symmetric(horizontal: screenWidth*0.03),
                  child: CustomGridView(movies: browseTabViewModel.movieList,

                  ),
                );
              },
            ),
          ),
        ],
      ),
    );
  }
}
