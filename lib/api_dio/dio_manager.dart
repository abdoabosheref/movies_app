import 'package:dio/dio.dart';
import 'package:movies_app/api_dio/api_constants.dart';
import 'package:movies_app/features/home_tab/data/models/movies_list_response.dart';
import 'package:pretty_dio_logger/pretty_dio_logger.dart';

class DioManager {
  static final Dio dio = Dio (
    BaseOptions(
      baseUrl: AapiConstants.movieListBaseUrl,
    queryParameters: {
      'limit': 20,

    })
      )..interceptors.add(
    PrettyDioLogger(
      requestHeader: true,
      requestBody: true,
      responseBody: true,
      responseHeader: false,
      error: true,
      compact: true,
      maxWidth: 90,
    ));



  static Future<MoviesListResponse> getMoviesList ()async{
    try {
      var response = await dio.get (AapiConstants.movieDetailsEndPoint,queryParameters:
      {
        'sort_by': 'date_added',

      });
      return MoviesListResponse.fromJson(response.data);
    }catch(e){
      rethrow ;
    }


  }


  static Future<MoviesListResponse> getMoviesListByGenre (String genre)async{
    try {
      var response = await dio.get (AapiConstants.movieDetailsEndPoint,queryParameters:
      {
        'sort_by': 'rating',
        'genre': genre,

      });
      return MoviesListResponse.fromJson(response.data);
    }catch(e){
      rethrow ;
    }


  }


}