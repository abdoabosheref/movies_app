import 'package:movies_app/domain/entities/movie_response/movie.dart';

class DataResponse {
  final int? movieCount;
  final int? limit;
  final int? pageNumber;
  final List<Movie>? movies;

  DataResponse({this.movieCount, this.movies, this.pageNumber, this.limit});
}
