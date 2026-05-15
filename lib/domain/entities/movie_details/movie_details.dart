import 'package:movies_app/domain/entities/movie_details/data.dart';

class MovieDetails {
  final String? status;
  final String? statusMessage;
  final Data? data;

  MovieDetails({this.status, this.statusMessage, this.data});
}
