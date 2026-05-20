import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:movies_app/core/utils/app_assets.dart';
import 'package:movies_app/core/utils/app_colors.dart';
import 'package:movies_app/core/utils/app_context.dart';
import 'package:movies_app/domain/use_cases/search_tab/search_tab_use_case.dart';
import 'package:movies_app/features/tabs/search_tab/cubit/search_tab_view_model.dart';

import '../../tabs/browse_tab/browse_tab.dart';
import '../../tabs/home_tab/presentation/cubit/home_tab_cubit.dart';
import '../../tabs/home_tab/presentation/screens/home_tab.dart';
import '../../tabs/profile_tab/profile_tab.dart';
import '../../tabs/search_tab/search_tab.dart';

class MainScreen extends StatefulWidget {
  const MainScreen({super.key});

  @override
  State<MainScreen> createState() => _MainScreenState();
}

class _MainScreenState extends State<MainScreen> {
  int currentIndex = 0;

  @override
  Widget build(BuildContext context) {
    List<Widget> tabs = [
      BlocProvider(
        create: (context) => HomeTabCubit()..loadHomeTabData(),
        child: HomeTab(
          seeMoreOnPressed: () {
            setState(() {
              currentIndex = 2;
            });
          },
        ),
      ),
      BlocProvider(
        create: (context) => SearchTabViewModel(context.read<SearchTabUseCase>()),
          child: SearchTab()),
      BrowseTab(),
      ProfileTab(),
    ];
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
    double screenWidth = context.screenWidth;
    double screenHeight = context.screenHeight;
    return Scaffold(
      extendBody: true,
      body: tabs[currentIndex],
      bottomNavigationBar: Container(
        height: screenHeight * 0.07,
        margin: EdgeInsets.only(
          left: screenWidth * 0.02,
          right: screenWidth * 0.02,
          bottom: screenHeight * 0.009,
        ),
        decoration: BoxDecoration(
          color: AppColors.darkGrey,
          borderRadius: BorderRadius.circular(16),
        ),
        child: BottomNavigationBar(
          elevation: 0,
          unselectedFontSize: 0,
          selectedFontSize: 0,
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
