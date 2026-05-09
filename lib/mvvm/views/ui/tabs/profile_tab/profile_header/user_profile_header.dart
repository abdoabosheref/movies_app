import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:movies_app/mvvm/views/ui/tabs/profile_tab/profile_header/profile_info_column.dart';
import 'package:movies_app/mvvm/views/ui/tabs/profile_tab/profile_header/user_avatar_with_user_name.dart';
class UserProfileHeader extends StatelessWidget {
  const UserProfileHeader({super.key});

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
      UserAvatarWithUserName(),
      ProfileInfoColumn(counter: 12,labelText: 'wish_list'.tr(),),
      ProfileInfoColumn(counter: 10,labelText: 'history'.tr(),),
    ],);
  }
}
