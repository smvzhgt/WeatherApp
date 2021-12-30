import 'package:get_it/get_it.dart';
import 'package:http/http.dart' as http;

import '../api_client/api_client.dart';
import '../db/data_base_client.dart';
import '../scenes/favorite/data/data_provider/favorite_data_provider_impl.dart';
import '../scenes/favorite/data/datasources/favorite_local_data_source_impl.dart';
import '../scenes/favorite/domain/data_providers/favorite_data_provider.dart';
import '../scenes/favorite/domain/interactors/favorite_interactor_impl.dart';
import '../scenes/location/data/data_providers/location_data_provider_impl.dart';
import '../scenes/location/data/datasources/location_remote_data_source_impl.dart';
import '../scenes/location/domain/data_providers/location_data_provider.dart';
import '../scenes/location/domain/interactors/location_interactor_impl.dart';
import '../scenes/location_search/data/data_providers/location_search_data_provider_impl.dart';
import '../scenes/location_search/data/datasources/location_search_database_data_source_impl.dart';
import '../scenes/location_search/data/datasources/location_search_memory_data_source_impl.dart';
import '../scenes/location_search/data/datasources/location_search_remote_data_source_impl.dart';
import '../scenes/location_search/domain/data_providers/location_search_data_provider.dart';
import '../scenes/location_search/domain/interactors/location_search_interactor_impl.dart';

final sl = GetIt.instance;

void init() {
  //
  // LocationSearch
  //

  // Remote DataSource
  sl.registerLazySingleton<LocationSearchRemoteDataSource>(
    () => LocationSearchRemoteDataSourceImpl(
      apiClient: sl(),
    ),
  );

  // Db DataSource
  sl.registerLazySingleton<LocationSearchDataBaseDataSource>(
    () => LocationSearchDataBaseDataSourceImpl(
      dataBaseClient: sl(),
    ),
  );

  // Memory DataSource
  sl.registerLazySingleton<LocationSearchMemoryDataSource>(
    () => LocationSearchMemoryDataSourceImpl(),
  );

  // DataProvider
  sl.registerLazySingleton<LocationSearchDataProvider>(
    () => LocationSearchDataProviderImpl(
      remoteDataSource: sl(),
      localDataSource: sl(),
      memoryDataSource: sl(),
    ),
  );

  // Interactor
  sl.registerLazySingleton<LocationSearchInteractor>(
    () => LocationSearchInteractorImpl(
      dataProvider: sl(),
    ),
  );

  //
  // Location
  //

  // Remote DataSource
  sl.registerLazySingleton<LocationRemoteDataSource>(
    () => LocationRemoteDataSourceImpl(
      apiClient: sl(),
    ),
  );

  // DataProvider
  sl.registerLazySingleton<LocationDataProvider>(
    () => LocationDataProviderImpl(
      remoteDataSource: sl(),
    ),
  );

  // Interactor
  sl.registerLazySingleton<LocationInteractor>(
    () => LocationInteractorImpl(
      dataProvider: sl(),
    ),
  );

  // HttpClient
  sl.registerLazySingleton<http.Client>(
    () => http.Client(),
  );

  // ApiClient
  sl.registerLazySingleton<ApiClient>(
    () => ApiClientImpl(
      client: sl(),
    ),
  );

  //
  // Favorite
  //

  // Db DataSource
  sl.registerLazySingleton<FavoriteLocalDataSource>(
    () => FavoriteLocalDataSourceImpl(
      dataBaseClient: sl(),
    ),
  );

  // DataProvider
  sl.registerLazySingleton<FavoriteDataProvider>(
    () => FavoriteDataProviderImpl(
      localDataSource: sl(),
    ),
  );

  // Interactor
  sl.registerLazySingleton<FavoriteInteractor>(
    () => FavoriteInteractorImpl(
      dataProvider: sl(),
    ),
  );

  // DataBase client
  sl.registerSingleton<DataBaseClient>(DataBaseClient.instance);
}
