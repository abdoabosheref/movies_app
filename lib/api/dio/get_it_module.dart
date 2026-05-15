import 'package:dio/dio.dart';
import 'package:injectable/injectable.dart';
import 'package:movies_app/api/dio/dio_interceptors.dart';
import 'package:pretty_dio_logger/pretty_dio_logger.dart';

import '../api_services.dart';
import '../end_points.dart';

@module
abstract class GetItModule {
  @lazySingleton
  BaseOptions get provideBaseOptions => BaseOptions(
    baseUrl: EndPoints.baseUrl,
    connectTimeout: const Duration(seconds: 5),
    receiveTimeout: const Duration(seconds: 5),
  );

  @lazySingleton
  PrettyDioLogger get providePrettyDioLogger => PrettyDioLogger(
    requestHeader: true,
    requestBody: true,
    responseHeader: true,
    responseBody: true,
    error: true,
    compact: true,
  );

  @lazySingleton
  Dio provideDio(BaseOptions baseOptions, PrettyDioLogger prettyDioLogger) {
    Dio dio = Dio(baseOptions);
    dio.interceptors.add(DioInterceptors());
    dio.interceptors.add(prettyDioLogger);

    return dio;
  }

  @lazySingleton
  ApiServices provideApiServices(Dio dio) => ApiServices(dio);
}
