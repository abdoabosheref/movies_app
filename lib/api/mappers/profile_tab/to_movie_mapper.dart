import 'package:movies_app/api/models/profile_tab/firebase_movie_model.dart';
import 'package:movies_app/domain/entities/movie_response/movie.dart';

extension ToMovieMapper on FirebaseMovieModel {
  Movie toMovie() {
    return Movie(
      id: int.parse(movieId),
      mediumCoverImage: mediumCoverImage,
      rating: rating ,
      url: ''
    );
  }
}
