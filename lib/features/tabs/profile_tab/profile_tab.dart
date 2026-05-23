import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:movies_app/core/di/di.dart';
import 'package:movies_app/core/utils/app_colors.dart';
import 'package:movies_app/core/utils/app_context.dart';
import 'package:movies_app/features/tabs/profile_tab/cubit/history/history_states.dart';
import 'package:movies_app/features/tabs/profile_tab/cubit/history/history_view_model.dart';
import 'package:movies_app/features/tabs/profile_tab/history_tab_bar.dart';
import 'package:movies_app/features/tabs/profile_tab/watch_list_tab_bar.dart';
import 'package:movies_app/features/tabs/profile_tab/widgets/profile_default_tab_controller/profile_tabs_section.dart';
import 'package:movies_app/features/tabs/profile_tab/widgets/profile_header/user_profile_header.dart';
import 'package:movies_app/features/tabs/profile_tab/widgets/row_of_buttons/profile_row_of_buttons.dart';

class ProfileTab extends StatelessWidget {
  const ProfileTab({super.key});

  @override
  Widget build(BuildContext context) {
    double screenWidth = context.screenWidth;
    double screenHeight = context.screenHeight;
    HistoryViewModel historyViewModel = getIt<HistoryViewModel>()
      ..getMovieHistory();

    return DefaultTabController(
      length: 2,
      child: Scaffold(
        body: SafeArea(
          child: NestedScrollView(
            headerSliverBuilder: (context, innerBoxIsScrolled) {
              return [
                SliverToBoxAdapter(
                  child: Container(
                    color: AppColors.mediumGrey,
                    padding: EdgeInsets.symmetric(
                      horizontal: screenWidth * 0.04,
                      vertical: screenHeight * 0.02,
                    ),
                    child: Column(
                      spacing: screenHeight * 0.02,
                      children: [
                        BlocBuilder<HistoryViewModel, HistoryStates>(
                          bloc: historyViewModel,
                          builder: (context, state) {
                            return UserProfileHeader(
                              historyCount: historyViewModel.getHistoryCount,
                            );
                          },
                        ),
                        ProfileRowOfButtons(),
                      ],
                    ),
                  ),
                ),
                SliverAppBar(
                  pinned: true,
                  backgroundColor: AppColors.mediumGrey,
                  bottom: const ProfileTabsSection(),
                ),
              ];
            },
            body: Padding(
              padding: EdgeInsetsGeometry.symmetric(
                horizontal: screenWidth * 0.04,
                vertical: screenHeight * 0.02,
              ),
              child: TabBarView(
                children: [
                  const WatchListTabBar(),
                  const HistoryTabBar(),
                ],
              ),

        ),
      ),
    )
      )
    );
  }
}
