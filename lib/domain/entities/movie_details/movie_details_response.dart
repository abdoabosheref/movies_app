import 'package:movies_app/domain/entities/movie_details/data.dart';

class MovieDetailsResponse {
  final String? status;
  final String? statusMessage;
  final Data? data;

  MovieDetailsResponse({this.status, this.statusMessage, this.data});
}
