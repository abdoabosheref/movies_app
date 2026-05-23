import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:movies_app/core/di/di.dart';
import 'package:movies_app/core/utils/app_assets.dart';
import 'package:movies_app/core/utils/app_context.dart';
import 'package:movies_app/features/tabs/profile_tab/cubit/history/history_states.dart';
import 'package:movies_app/features/tabs/profile_tab/cubit/history/history_view_model.dart';
import 'package:movies_app/features/widgets/custom_error_column.dart';
import 'package:movies_app/features/widgets/custom_grid_view.dart';
import 'package:movies_app/features/widgets/main_loading.dart';

class HistoryTabBar extends StatefulWidget {
  const HistoryTabBar({super.key});

  @override
  State<HistoryTabBar> createState() => _HistoryTabBarState();
}

class _HistoryTabBarState extends State<HistoryTabBar> {
  late HistoryViewModel historyViewModel;
  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    historyViewModel = getIt<HistoryViewModel>()..getMovieHistory();
  }
  @override
  Widget build(BuildContext context) {
    double screenHeight = context.screenHeight;
    return BlocBuilder<HistoryViewModel, HistoryStates>(
      bloc: historyViewModel,
      builder: (context, state) {
        if (state is HistoryLoadingState) {
          return MainLoading();
        }

        if (state is HistoryErrorState) {
          return CustomErrorColumn(
            errorMessage: state.appException.message,
            onPressed: () {
              historyViewModel.getMovieHistory();
            },
          );
        }

          final movies = historyViewModel.historyMovies;
          if (movies.isEmpty) {
            return Center(
              child: Image.asset(
                AppAssets.popCorn,
                height: screenHeight * 0.15,
              ),
            );
          }

          return CustomGridView(movies: movies, crossAxisCount: 3);

      },
    );
  }
}
