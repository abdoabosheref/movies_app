// GENERATED CODE - DO NOT MODIFY BY HAND
// dart format width=80

// **************************************************************************
// InjectableConfigGenerator
// **************************************************************************

// ignore_for_file: type=lint
// coverage:ignore-file

// ignore_for_file: no_leading_underscores_for_library_prefixes
import 'package:dio/dio.dart' as _i361;
import 'package:get_it/get_it.dart' as _i174;
import 'package:injectable/injectable.dart' as _i526;
import 'package:pretty_dio_logger/pretty_dio_logger.dart' as _i528;

import '../../api/api_services.dart' as _i394;
import '../../api/data_sources/remote/movie_details/movie_details_remote_data_source_impl.dart'
    as _i140;
import '../../api/data_sources/remote/movie_suggestions/movie_suggestions_remote_data_source_impl.dart'
    as _i383;
import '../../api/dio/get_it_module.dart' as _i814;
import '../../data/data_sources/remote/movie_details/movie_details_remote_data_source.dart'
    as _i321;
import '../../data/data_sources/remote/movie_suggestions/movie_suggestions_remote_data_source.dart'
    as _i294;
import '../../data/repositories/movie_details/movie_details_repository_impl.dart'
    as _i239;
import '../../data/repositories/movie_suggestions/movie_suggestions_repository_impl.dart'
    as _i975;
import '../../domain/repositories/movie_details/movie_details_repository.dart'
    as _i846;
import '../../domain/repositories/movie_suggestions/movie_suggestions_repository.dart'
    as _i725;
import '../../domain/use_cases/movie_details/movie_details_use_case.dart'
    as _i763;
import '../../domain/use_cases/movie_suggestions/movie_suggestions_use_case.dart'
    as _i541;
import '../../features/screens/movie_details/cubit/movie_details_view_model.dart'
    as _i150;
import '../../features/screens/movie_suggestions/cubit/movie_suggestions_view_model.dart'
    as _i966;

extension GetItInjectableX on _i174.GetIt {
  // initializes the registration of main-scope dependencies inside of GetIt
  _i174.GetIt init({
    String? environment,
    _i526.EnvironmentFilter? environmentFilter,
  }) {
    final gh = _i526.GetItHelper(this, environment, environmentFilter);
    final getItModule = _$GetItModule();
    gh.lazySingleton<_i361.BaseOptions>(() => getItModule.provideBaseOptions);
    gh.lazySingleton<_i528.PrettyDioLogger>(
      () => getItModule.providePrettyDioLogger,
    );
    gh.lazySingleton<_i361.Dio>(
      () => getItModule.provideDio(
        gh<_i361.BaseOptions>(),
        gh<_i528.PrettyDioLogger>(),
      ),
    );
    gh.lazySingleton<_i394.ApiServices>(
      () => getItModule.provideApiServices(gh<_i361.Dio>()),
    );
    gh.factory<_i321.MovieDetailsRemoteDataSource>(
      () => _i140.MovieDetailsRemoteDataSourceImpl(gh<_i394.ApiServices>()),
    );
    gh.factory<_i294.MovieSuggestionsRemoteDataSource>(
      () => _i383.MovieSuggestionsRemoteDataSourceImpl(gh<_i394.ApiServices>()),
    );
    gh.factory<_i846.MovieDetailsRepository>(
      () => _i239.MovieDetailsRepositoryImpl(
        gh<_i321.MovieDetailsRemoteDataSource>(),
      ),
    );
    gh.factory<_i725.MovieSuggestionsRepository>(
      () => _i975.MovieSuggestionsRepositoryImpl(
        gh<_i294.MovieSuggestionsRemoteDataSource>(),
      ),
    );
    gh.factory<_i763.MovieDetailsUseCase>(
      () => _i763.MovieDetailsUseCase(gh<_i846.MovieDetailsRepository>()),
    );
    gh.factory<_i150.MovieDetailsViewModel>(
      () => _i150.MovieDetailsViewModel(gh<_i763.MovieDetailsUseCase>()),
    );
    gh.factory<_i541.MovieSuggestionsUseCase>(
      () =>
          _i541.MovieSuggestionsUseCase(gh<_i725.MovieSuggestionsRepository>()),
    );
    gh.factory<_i966.MovieSuggestionsViewModel>(
      () =>
          _i966.MovieSuggestionsViewModel(gh<_i541.MovieSuggestionsUseCase>()),
    );
    return this;
  }
}

class _$GetItModule extends _i814.GetItModule {}
