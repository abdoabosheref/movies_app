import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:movies_app/core/di/di.dart';
import 'package:movies_app/features/tabs/profile_tab/profile_header/profile_info_column.dart';
import 'package:movies_app/features/tabs/profile_tab/profile_header/user_avatar_with_user_name.dart';
import '../cubit/watchlist_view_model.dart';

class UserProfileHeader extends StatelessWidget {
  const UserProfileHeader({super.key});

  @override
  Widget build(BuildContext context) {
    final watchlistViewModel = getIt<WatchlistViewModel>();

    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        const UserAvatarWithUserName(),

        StreamBuilder<int>(
          stream: watchlistViewModel.getWatchlistCount(),
          builder: (context, snapshot) {
            int count = snapshot.data ?? 0;

            return ProfileInfoColumn(
              counter: count,
              labelText: 'wish_list'.tr(),
            );
          },
        ),

        ProfileInfoColumn(
          counter: 10,
          labelText: 'history'.tr(),
        ),
      ],
    );
  }
}