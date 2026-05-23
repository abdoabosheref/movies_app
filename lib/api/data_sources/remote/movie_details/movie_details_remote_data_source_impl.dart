import 'package:injectable/injectable.dart';
import 'package:movies_app/api/api_services.dart';
import 'package:movies_app/api/mappers/movie_details/movie_details_response_mapper.dart';
import 'package:movies_app/data/data_sources/remote/movie_details/movie_details_remote_data_source.dart';
import 'package:movies_app/domain/entities/movie_details/movie_details_response.dart';

@Injectable(as: MovieDetailsRemoteDataSource)
class MovieDetailsRemoteDataSourceImpl implements MovieDetailsRemoteDataSource {
  final ApiServices _apiServices;

  MovieDetailsRemoteDataSourceImpl(this._apiServices);

  @override
  Future<MovieDetailsResponse> fetchMovieDetails({required int movieId}) async {
    final movieDetailsResponse = await _apiServices.fetchMovieDetails(
      movieId: movieId,
    );
    return movieDetailsResponse.toMovieDetailsResponse();
  }
}
