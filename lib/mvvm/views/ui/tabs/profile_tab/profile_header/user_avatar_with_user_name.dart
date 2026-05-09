import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:movies_app/core/utils/app_styles.dart';
import 'package:movies_app/features/auth/presentation/cubit/auth_states.dart';

import '../../../../../../features/auth/presentation/cubit/auth_cubit.dart';

class UserAvatarWithUserName extends StatelessWidget {
  const UserAvatarWithUserName({super.key});

  @override
  Widget build(BuildContext context) {
    AuthCubit authCubit = context.read<AuthCubit>();
    final user = authCubit.currentUser!;
    String avatarImageName =
        'assets/images/avatar_image_${user.avatarIndex + 1}.png';
    return BlocBuilder<AuthCubit, AuthState>(
      builder: (context, state) {
        return Column(
          children: [
            CircleAvatar(
              backgroundImage: AssetImage(avatarImageName),
              radius: 50,
            ),
            Text(user.name, style: AppStyles.white20BoldRoboto),
          ],
        );
      },
    );
  }
}
