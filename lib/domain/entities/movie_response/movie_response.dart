import 'package:movies_app/domain/entities/movie_response/data_response.dart';

class MovieResponse {
  final String? status;
  final String? statusMessage;
  final DataResponse? data;

  MovieResponse({this.status, this.statusMessage, this.data});
}
