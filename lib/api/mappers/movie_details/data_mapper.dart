import 'package:movies_app/api/mappers/movie_details/movie_details_mapper.dart';
import 'package:movies_app/api/models/movie_details/data_dto.dart';
import 'package:movies_app/domain/entities/movie_details/data.dart';

extension DataMapper on DataDto {
  Data toData() {
    return Data(movie: movie?.toMovieDetails());
  }
}
