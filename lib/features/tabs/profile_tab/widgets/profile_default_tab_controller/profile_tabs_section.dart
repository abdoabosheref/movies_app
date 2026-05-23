import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:movies_app/core/utils/app_assets.dart';
import 'package:movies_app/core/utils/app_colors.dart';
import 'package:movies_app/core/utils/app_styles.dart';

class ProfileTabsSection extends StatelessWidget
    implements PreferredSizeWidget {
  const ProfileTabsSection({super.key});

  @override
  Widget build(BuildContext context) {
    return TabBar(
      indicatorColor: AppColors.yellow,

      indicatorSize: TabBarIndicatorSize.tab,

      unselectedLabelStyle: AppStyles.white20RegularRoboto,

      labelStyle: AppStyles.white20RegularRoboto,

      dividerColor: AppColors.transparent,

      tabs: <Widget>[
        Tab(
          icon: SvgPicture.asset(AppAssets.watchList),

          text: 'watch_list'.tr(),
        ),

        Tab(icon: SvgPicture.asset(AppAssets.history), text: 'history'.tr()),
      ],
    );
  }

  @override
  Size get preferredSize => const Size.fromHeight(20);
}
