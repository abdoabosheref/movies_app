import 'package:movies_app/domain/entities/movie_suggestions/movies.dart';

class DataSuggestions {
  final int? movieCount;
  final List<Movies>? movies;

  DataSuggestions({this.movieCount, this.movies});
}
