import 'package:flutter/material.dart';
import 'package:movies_app/core/utils/app_assets.dart';
import 'package:movies_app/core/utils/app_styles.dart';

class UserAvatarWithUserName extends StatelessWidget {
  const UserAvatarWithUserName({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(children: [
      CircleAvatar(backgroundImage: AssetImage(AppAssets.avatarImage8),radius: 50,),
      Text('John Safwat',style: AppStyles.white20BoldRoboto,)
    ],);
  }
}
