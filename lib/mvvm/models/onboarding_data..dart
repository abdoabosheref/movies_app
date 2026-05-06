import 'package:easy_localization/easy_localization.dart';
import 'package:movies_app/core/utils/app_assets.dart';


import 'OnboardingModel.dart';


List<OnboardingModel> getOnboardingData(context) {
  return [
    OnboardingModel(
      image: AppAssets.onBoarding1,
      title : 'find_your_next_favorite_movie_here'.tr(),
      desc: 'get_access_to_a_huge_library_of_movies_to_suit_all_tastes'.tr(),
    ),
    OnboardingModel(
      image: AppAssets.onBoarding2,
      title : 'discover_movies'.tr(),
      desc: 'explore_a_vast_collection_of_movies'.tr(),

    ),
    OnboardingModel(
      image: AppAssets.onBoarding3,
      title : 'explore_all_genres'.tr(),
      desc: 'discover_movies_from_every_genre'.tr(),
    ),
    OnboardingModel(
      image: AppAssets.onBoarding4,
      title : 'create_watchlists'.tr(),
      desc: 'save_movies_to_your_watchlist'.tr(),
),
    OnboardingModel(
      image: AppAssets.onBoarding5,
      title : 'rate_review_and_learn'.tr(),
      desc: 'share_your_thoughts'.tr(),
    ),
    OnboardingModel(
      image: AppAssets.onBoarding6,
      title : 'start_watching_now'.tr(),
    ),

  ];
}