import 'package:flutter/material.dart';
import 'package:movies_app/core/utils/app_assets.dart';
import 'package:movies_app/core/utils/app_colors.dart';
import 'package:movies_app/core/utils/app_context.dart';
import 'package:movies_app/mvvm/views/ui/tabs/profile_tab/profile_tab.dart';
import 'package:movies_app/mvvm/views/ui/tabs/search_tab/search_tab.dart';

import '../../tabs/browse_tab/browse_tab.dart';
import '../../tabs/home_tab/home_tab.dart';

class MainScreen extends StatefulWidget {
  const MainScreen({super.key});

  @override
  State<MainScreen> createState() => _MainScreenState();
}

class _MainScreenState extends State<MainScreen> {
  int currentIndex = 3;
  List<Widget> tabs = [HomeTab(), SearchTab(), BrowseTab(), ProfileTab()];
  List<BottomNavigationBarItem> items = [
    BottomNavigationBarItem(
      icon: ImageIcon(AssetImage(AppAssets.homeTabIcon)),
      label: 'homeTab',
    ),
    BottomNavigationBarItem(
      icon: ImageIcon(AssetImage(AppAssets.searchTabIcon)),
      label: 'searchTab',
    ),
    BottomNavigationBarItem(
      icon: ImageIcon(AssetImage(AppAssets.browseTabIcon)),
      label: 'browseTab',
    ),
    BottomNavigationBarItem(
      icon: ImageIcon(AssetImage(AppAssets.profileTabIcon)),
      label: 'profileTab',
    ),
  ];
  @override
  Widget build(BuildContext context) {
    double screenWidth = context.screenWidth;
    double screenHeight = context.screenHeight;
    return Scaffold(
      body: tabs[currentIndex],
      bottomNavigationBar: Container(
        margin: EdgeInsets.only(
          left: screenWidth * 0.02,
          right: screenWidth * 0.02,
          bottom: screenHeight * 0.01,
        ),
        decoration: BoxDecoration(
          color: AppColors.darkGrey,
          borderRadius: BorderRadius.circular(16),
        ),
        child: BottomNavigationBar(
          type: BottomNavigationBarType.fixed,
          backgroundColor: AppColors.transparent,
          showUnselectedLabels: false,
          showSelectedLabels: false,
          unselectedItemColor: AppColors.white,
          selectedItemColor: AppColors.yellow,
          currentIndex: currentIndex,
          onTap: (index) {
            setState(() {
              currentIndex = index;
            });
          },
          items: items,
        ),
      ),
    );
  }
}
