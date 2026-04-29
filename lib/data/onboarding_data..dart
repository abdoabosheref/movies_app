import 'package:flutter/material.dart';
import 'package:movies_app/l10n/app_localizations.dart';
import 'package:movies_app/utils/app_image.dart';

import '../core/data_model/OnboardingModel.dart';


List<OnboardingModel> getOnboardingData(context) {
  return [
    OnboardingModel(
      image: AppImage.onB1,
      title: AppLocalizations.of(context)!.onboarding_title_1,
      desc: AppLocalizations.of(context)!.onboarding_subtitle_1,
      gradient: [
        Colors.black.withOpacity(0.2),
        Colors.red.withOpacity(0.4),
        Colors.black.withOpacity(0.9),
      ],
    ),
    OnboardingModel(
      image: AppImage.onB2,
      title: AppLocalizations.of(context)!.onboarding_title_2,
      desc: AppLocalizations.of(context)!.onboarding_subtitle_2,
      gradient: [
        const Color.fromRGBO(8, 66, 80, 0),
        const Color.fromRGBO(8, 66, 80, 1),
      ],
    ),
    OnboardingModel(
      image: AppImage.onB3,
      title: AppLocalizations.of(context)!.onboarding_title_3,
      desc: AppLocalizations.of(context)!.onboarding_subtitle_3,
      gradient: [
        const Color.fromRGBO(133, 33, 14, 0),
        const Color.fromRGBO(133, 33, 14, 0)
      ],
    ),
OnboardingModel(
      image: AppImage.onB4,
      title: AppLocalizations.of(context)!.onboarding_title_4,
      desc: AppLocalizations.of(context)!.onboarding_subtitle_4,
      gradient: [
        const Color.fromRGBO(76, 36, 113, 0),
        const Color.fromRGBO(76, 36, 113, 1)
      ],
    ),
OnboardingModel(
      image: AppImage.onB5,
      title: AppLocalizations.of(context)!.onboarding_title_5,
      desc: AppLocalizations.of(context)!.onboarding_subtitle_5,
      gradient: [
        const Color.fromRGBO(96, 19, 33, 0),
        const Color.fromRGBO(96, 19, 33, 1)
      ],
    ),
    OnboardingModel(
      image: AppImage.onB6,
      title: AppLocalizations.of(context)!.start_watching_now,
      desc: AppLocalizations.of(context)!.onboarding_subtitle_5,
      gradient: [
        const Color.fromRGBO(42, 44, 48, 0),
        const Color.fromRGBO(42, 44, 48, 1)
      ],
    ),

  ];
}