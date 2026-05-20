import 'package:injectable/injectable.dart';
import 'package:movies_app/data/data_sources/remote/movie_details/movie_details_remote_data_source.dart';
import 'package:movies_app/domain/entities/movie_details/movie_details_response.dart';
import 'package:movies_app/domain/repositories/movie_details/movie_details_repository.dart';

@Injectable(as: MovieDetailsRepository)
class MovieDetailsRepositoryImpl implements MovieDetailsRepository {
  final MovieDetailsRemoteDataSource _movieDetailsRemoteDataSource;

  MovieDetailsRepositoryImpl(this._movieDetailsRemoteDataSource);

  @override
  Future<MovieDetailsResponse> fetchMovieDetails({required int movieId}) {
    return _movieDetailsRemoteDataSource.fetchMovieDetails(movieId: movieId);
  }
}
