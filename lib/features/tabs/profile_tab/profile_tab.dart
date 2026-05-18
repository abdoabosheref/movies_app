import 'package:flutter/material.dart';
import 'package:movies_app/core/utils/app_assets.dart';
import 'package:movies_app/core/utils/app_context.dart';
import 'package:movies_app/features/tabs/profile_tab/profile_default_tab_controller/profile_tabs_section.dart';
import 'package:movies_app/features/tabs/profile_tab/profile_header/user_profile_header.dart';
import 'package:movies_app/features/tabs/profile_tab/row_of_buttons/profile_row_of_buttons.dart';

class ProfileTab extends StatelessWidget {
  const ProfileTab({super.key});

  @override
  Widget build(BuildContext context) {
    double screenWidth = context.screenWidth;
    double screenHeight = context.screenHeight;

    return DefaultTabController(
      length: 2,
      child: Scaffold(
        body: SafeArea(
          child: Padding(
            padding: EdgeInsets.symmetric(
              horizontal: screenWidth * 0.04,
              vertical: screenHeight * 0.02,
            ),
            child: Column(
              spacing: screenHeight * 0.02,
              children: [
                UserProfileHeader(),
                ProfileRowOfButtons(),
                ProfileTabsSection(),
                Expanded(
                  child: TabBarView(
                    children: [
                      Center(child: Image.asset(
                        AppAssets.popCorn, height: screenHeight * 0.15,)),
                      Center(child: Image.asset(
                        AppAssets.popCorn, height: screenHeight * 0.15,)),
                    ],
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
