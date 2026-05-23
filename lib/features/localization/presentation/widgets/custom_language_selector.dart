import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:movies_app/core/utils/app_assets.dart';
import 'package:movies_app/core/utils/app_colors.dart';
import 'package:movies_app/core/utils/app_context.dart';

import '../cubit/local_cubit.dart';
import '../cubit/local_states.dart';
import 'custom_flag_button.dart';

class CustomLanguageSelector extends StatelessWidget {
  const CustomLanguageSelector({super.key});

  @override
  Widget build(BuildContext context) {
    double screenWidth = context.screenWidth;
    LocalCubit localCubit = context.read<LocalCubit>();
    return BlocBuilder<LocalCubit, LocalStates>(
      builder: (context, state) {
        return Container(
          width: screenWidth * 0.3,
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(30),
            border: Border.all(color: AppColors.yellow, width: 2),
          ),
          child: Row(
            textDirection: .ltr,
            mainAxisAlignment: .spaceBetween,
            children: [
              CustomFlagButton(
                onPressed: () => localCubit.changeLanguage(
                  context: context,
                  newLanguageCode: 'en',
                ),
                flagName: AppAssets.usaFlagIcon,
                isSelected: localCubit.isSelectedLanguage(languageCode: 'en'),
              ),
              CustomFlagButton(
                onPressed: () => localCubit.changeLanguage(
                  context: context,
                  newLanguageCode: 'ar',
                ),
                flagName: AppAssets.egyptFlagIcon,
                isSelected: localCubit.isSelectedLanguage(languageCode: 'ar'),
              ),
            ],
          ),
        );
      },
    );
  }
}
