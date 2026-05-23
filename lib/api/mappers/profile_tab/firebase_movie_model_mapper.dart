import 'package:movies_app/api/models/profile_tab/firebase_movie_model.dart';
import 'package:movies_app/domain/entities/movie_response/movie.dart';

extension FirebaseMovieModelMapper on Movie {
  FirebaseMovieModel toFirebaseMovieModel() {
    return FirebaseMovieModel(
      movieId: id.toString(),
      mediumCoverImage: mediumCoverImage ?? '',
      rating: rating ?? 0,
    );
  }
}
