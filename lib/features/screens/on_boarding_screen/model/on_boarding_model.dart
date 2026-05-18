import 'package:movies_app/core/utils/app_assets.dart';

class OnBoardingModel {
  final String image;
  final String title;
  final String desc;

  OnBoardingModel({required this.image, required this.title, this.desc = ''});
}

List<OnBoardingModel> onBoardingData = [
  OnBoardingModel(
    image: AppAssets.onBoarding1,
    title: 'find_your_next_favorite_movie_here',
    desc: 'get_access_to_a_huge_library_of_movies_to_suit_all_tastes',
  ),
  OnBoardingModel(
    image: AppAssets.onBoarding2,
    title: 'discover_movies',
    desc: 'explore_a_vast_collection_of_movies',
  ),
  OnBoardingModel(
    image: AppAssets.onBoarding3,
    title: 'explore_all_genres',
    desc: 'discover_movies_from_every_genre',
  ),
  OnBoardingModel(
    image: AppAssets.onBoarding4,
    title: 'create_watchlists',
    desc: 'save_movies_to_your_watchlist',
  ),
  OnBoardingModel(
    image: AppAssets.onBoarding5,
    title: 'rate_review_and_learn',
    desc: 'share_your_thoughts',
  ),
  OnBoardingModel(image: AppAssets.onBoarding6, title: 'start_watching_now'),
];
