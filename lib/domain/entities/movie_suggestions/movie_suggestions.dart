import 'package:movies_app/domain/entities/movie_suggestions/data_suggestions.dart';

class MovieSuggestions {
  final String? status;
  final String? statusMessage;
  final DataSuggestions? data;

  MovieSuggestions({this.status, this.statusMessage, this.data});
}
