import 'package:dio/dio.dart';
import 'package:movies_app/api/end_points.dart';
import 'package:pretty_dio_logger/pretty_dio_logger.dart';

import '../features/tabs/home_tab/data/models/movies_list_response.dart';

class DioManager {
  static final Dio dio =
      Dio(
          BaseOptions(
            baseUrl: EndPoints.baseUrl,
            queryParameters: {'limit': 20},
          ),
        )
        ..interceptors.add(
          PrettyDioLogger(
            requestHeader: true,
            requestBody: true,
            responseBody: true,
            responseHeader: false,
            error: true,
            compact: true,
            maxWidth: 90,
          ),
        );

  // static Future<MoviesListResponse> getMoviesList() async {
  //   try {
  //     var response = await dio.get(
  //       EndPoints.listMoviesEndPoint,
  //       queryParameters: {'sort_by': 'date_added','genre' : 'Romance'},
  //     );
  //     return MoviesListResponse.fromJson(response.data);
  //   } catch (e) {
  //     rethrow;
  //   }
  // }
  static Future<MoviesListResponse> getMoviesList({String? genre, String? queryTerm, int page = 1}) async {
    try {
      final Map<String,dynamic> queryParameters = {
        'sort_by': 'date_added',
        'page':page
      };
      if(genre != null && genre != 'All' && genre.trim().isNotEmpty){
        queryParameters['genre'] = 'Romance';
      }
      if(queryTerm != null&&queryTerm.trim().isNotEmpty){
        queryParameters['query_term'] = queryTerm;
    }
      var response = await dio.get(
        EndPoints.listMoviesEndPoint,
        queryParameters:queryParameters
      );
      return MoviesListResponse.fromJson(response.data);
    } catch (e) {
      rethrow;
    }
  }

  static Future<MoviesListResponse> getMoviesListByGenre(String genre) async {
    try {
      var response = await dio.get(
        EndPoints.listMoviesEndPoint,
        queryParameters: {'sort_by': 'rating', 'genre': genre},
      );
      return MoviesListResponse.fromJson(response.data);
    } catch (e) {
      rethrow;
    }
  }
}
