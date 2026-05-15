import 'package:dio/dio.dart';
import 'package:movies_app/features/home_tab/data/models/movies_list_response.dart';
import 'package:pretty_dio_logger/pretty_dio_logger.dart';

class DioManager {
//https://movies-api.accel.li/api/v2/list_movies.json
  static final Dio dio = Dio (
    BaseOptions(
      baseUrl: "https://movies-api.accel.li",
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
      var response = await dio.get ('/api/v2/list_movies.json',queryParameters:
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
      var response = await dio.get ('/api/v2/list_movies.json',queryParameters:
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