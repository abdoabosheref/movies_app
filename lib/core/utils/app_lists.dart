import 'package:movies_app/mvvm/models/movie_model.dart';
import 'app_assets.dart';

class AppLists {
  static final List<String> avatarList = [
    AppAssets.avatarImage1,
    AppAssets.avatarImage2,
    AppAssets.avatarImage3,
    AppAssets.avatarImage4,
    AppAssets.avatarImage5,
    AppAssets.avatarImage6,
    AppAssets.avatarImage7,
    AppAssets.avatarImage8,
    AppAssets.avatarImage9,
  ];

  static final List<Movie> dummyMovies = [
    Movie(
      title: "Doctor Strange in the Multiverse of Madness",
      year: "2022",
      rating: "7.6",
      duration: "126 min",
      likes: "15k",
      summary: "Following the events of Spider-Man: No Way Home, Doctor Strange unwittingly casts a forbidden spell that accidentally opens up the multiverse...",
      image: AppAssets.watchNowImage,
      screenShots: [
        AppAssets.availableNowImage,
        AppAssets.watchNowImage,
        AppAssets.onBoarding1,
      ],
      cast: [
        Cast(name: "Benedict Cumberbatch", character: "Dr. Stephen Strange", image: AppAssets.avatarImage1),
        Cast(name: "Elizabeth Olsen", character: "Wanda Maximoff / Scarlet Witch", image: AppAssets.avatarImage2),
      ],
      genres: ["Action", "Sci-Fi", "Adventure"],
    ),
    Movie(
      title: "Black Widow",
      year: "2021",
      rating: "6.7",
      duration: "134 min",
      likes: "10k",
      summary: "Natasha Romanoff confronts the darker parts of her ledger when a dangerous conspiracy with ties to her past arises.",
      image: AppAssets.onBoarding4,
      screenShots: [AppAssets.onBoarding1, AppAssets.onBoarding2],
      cast: [
        Cast(name: "Scarlett Johansson", character: "Natasha Romanoff", image: AppAssets.avatarImage3),
      ],
      genres: ["Action", "Adventure", "Sci-Fi"],
    ),
  ];
}
