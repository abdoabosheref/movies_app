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
import '../../api/data_sources/remote/browse_tab/browse_tab_remote_data_source_impl.dart'
    as _i315;
import '../../api/data_sources/remote/movie_details/movie_details_remote_data_source_impl.dart'
    as _i140;
import '../../api/data_sources/remote/movie_suggestions/movie_suggestions_remote_data_source_impl.dart'
    as _i383;
import '../../api/data_sources/remote/profile_tab/history/history_remote_data_source_impl.dart'
    as _i582;
import '../../api/dio/get_it_module.dart' as _i814;
import '../../data/data_sources/remote/browse_tab/browse_tab_remote_data_source.dart'
    as _i989;
import '../../data/data_sources/remote/movie_details/movie_details_remote_data_source.dart'
    as _i321;
import '../../data/data_sources/remote/movie_suggestions/movie_suggestions_remote_data_source.dart'
    as _i294;
import '../../data/data_sources/remote/profile_tab/history/history_remote_data_source.dart'
    as _i967;
import '../../data/repositories/browse_tab/browse_tab_repository_impl.dart'
    as _i596;
import '../../data/repositories/movie_details/movie_details_repository_impl.dart'
    as _i239;
import '../../data/repositories/movie_suggestions/movie_suggestions_repository_impl.dart'
    as _i975;
import '../../data/repositories/profile_tab/history/history_repository.dart'
    as _i13;
import '../../domain/repositories/browse_tab/browse_tab_repository.dart'
    as _i700;
import '../../domain/repositories/movie_details/movie_details_repository.dart'
    as _i846;
import '../../domain/repositories/movie_suggestions/movie_suggestions_repository.dart'
    as _i725;
import '../../domain/repositories/profile_tab/history/history_repository_impl.dart'
    as _i530;
import '../../domain/use_cases/browse_tab/browse_tab_use_case.dart' as _i951;
import '../../domain/use_cases/movie_details/movie_details_use_case.dart'
    as _i763;
import '../../domain/use_cases/movie_suggestions/movie_suggestions_use_case.dart'
    as _i541;
import '../../domain/use_cases/profile_tab/history/add_movie_to_history_use_case.dart'
    as _i670;
import '../../features/screens/movie_details/cubit/movie_details_view_model.dart'
    as _i40;
import '../../features/screens/movie_suggestions/cubit/movie_suggestions_view_model.dart'
    as _i505;
import '../../features/tabs/browse_tab/cubit/browse_tab_view_model.dart'
    as _i780;
import '../../features/tabs/profile_tab/cubit/history/history_view_model.dart'
    as _i117;

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
    gh.factory<_i967.HistoryRemoteDataSource>(
      () => _i582.HistoryRemoteDataSourceImpl(),
    );
    gh.lazySingleton<_i361.Dio>(
      () => getItModule.provideDio(
        gh<_i361.BaseOptions>(),
        gh<_i528.PrettyDioLogger>(),
      ),
    );
    gh.factory<_i13.HistoryRepository>(
      () => _i530.HistoryRepositoryImpl(gh<_i967.HistoryRemoteDataSource>()),
    );
    gh.factory<_i670.AddMovieToHistoryUseCase>(
      () => _i670.AddMovieToHistoryUseCase(gh<_i13.HistoryRepository>()),
    );
    gh.lazySingleton<_i394.ApiServices>(
      () => getItModule.provideApiServices(gh<_i361.Dio>()),
    );
    gh.factory<_i321.MovieDetailsRemoteDataSource>(
      () => _i140.MovieDetailsRemoteDataSourceImpl(gh<_i394.ApiServices>()),
    );
    gh.factory<_i117.HistoryViewModel>(
      () => _i117.HistoryViewModel(gh<_i670.AddMovieToHistoryUseCase>()),
    );
    gh.factory<_i989.BrowseTabRemoteDataSource>(
      () => _i315.BrowseTabRemoteDataSourceImpl(gh<_i394.ApiServices>()),
    );
    gh.factory<_i294.MovieSuggestionsRemoteDataSource>(
      () => _i383.MovieSuggestionsRemoteDataSourceImpl(gh<_i394.ApiServices>()),
    );
    gh.factory<_i846.MovieDetailsRepository>(
      () => _i239.MovieDetailsRepositoryImpl(
        gh<_i321.MovieDetailsRemoteDataSource>(),
      ),
    );
    gh.factory<_i700.BrowseTabRepository>(
      () =>
          _i596.BrowseTabRepositoryImpl(gh<_i989.BrowseTabRemoteDataSource>()),
    );
    gh.factory<_i725.MovieSuggestionsRepository>(
      () => _i975.MovieSuggestionsRepositoryImpl(
        gh<_i294.MovieSuggestionsRemoteDataSource>(),
      ),
    );
    gh.factory<_i763.MovieDetailsUseCase>(
      () => _i763.MovieDetailsUseCase(gh<_i846.MovieDetailsRepository>()),
    );
    gh.factory<_i951.BrowseTabUseCase>(
      () => _i951.BrowseTabUseCase(gh<_i700.BrowseTabRepository>()),
    );
    gh.factory<_i40.MovieDetailsViewModel>(
      () => _i40.MovieDetailsViewModel(gh<_i763.MovieDetailsUseCase>()),
    );
    gh.factory<_i541.MovieSuggestionsUseCase>(
      () =>
          _i541.MovieSuggestionsUseCase(gh<_i725.MovieSuggestionsRepository>()),
    );
    gh.factory<_i780.BrowseTabViewModel>(
      () => _i780.BrowseTabViewModel(gh<_i951.BrowseTabUseCase>()),
    );
    gh.factory<_i505.MovieSuggestionsViewModel>(
      () =>
          _i505.MovieSuggestionsViewModel(gh<_i541.MovieSuggestionsUseCase>()),
    );
    return this;
  }
}

class _$GetItModule extends _i814.GetItModule {}
