import 'package:forecastapp/scenes/location_search/data/services/location_search_local_data_service_impl.dart';
import 'package:forecastapp/scenes/location_search/data/services/location_search_memory_data_service_impl.dart';
import 'package:get_it/get_it.dart';
import 'package:http/http.dart' as http;

import '../api_client/api_client.dart';
import '../db/data_base_client.dart';
import '../scenes/favorite/data/data_provider/favorite_data_provider_impl.dart';
import '../scenes/favorite/data/services/favorite_local_data_service_impl.dart';
import '../scenes/favorite/domain/data_providers/favorite_data_provider.dart';
import '../scenes/favorite/domain/interactors/favorite_interactor_impl.dart';
import '../scenes/location/data/data_providers/location_data_provider_impl.dart';
import '../scenes/location/data/services/location_remote_data_service_impl.dart';
import '../scenes/location/domain/data_providers/location_data_provider.dart';
import '../scenes/location/domain/interactors/location_interactor_impl.dart';
import '../scenes/location_search/data/data_providers/location_search_data_provider_impl.dart';
import '../scenes/location_search/data/services/location_search_remote_data_service_impl.dart';
import '../scenes/location_search/domain/data_providers/location_search_data_provider.dart';
import '../scenes/location_search/domain/interactors/location_search_interactor_impl.dart';

final sl = GetIt.instance;

void init() {
  //
  // LocationSearch
  //

  // Remote Service
  sl.registerLazySingleton<LocationSearchRemoteDataService>(
    () => LocationSearchRemoteDataServiceImpl(apiClient: sl()),
  );

  // Local Service
  sl.registerLazySingleton<LocationSearchLocalDataService>(
    () => LocationSearchLocalDataServiceImpl(dataBaseClient: sl()),
  );

  // Memory Service
  sl.registerLazySingleton<LocationSearchMemoryDataService>(
    () => LocationSearchMemoryDataServiceImpl(),
  );

  // DataProvider
  sl.registerLazySingleton<LocationSearchDataProvider>(
    () => LocationSearchDataProviderImpl(
        remoteDataService: sl(),
        localDataService: sl(),
        memoryDataService: sl()),
  );

  // Interactor
  sl.registerLazySingleton<LocationSearchInteractor>(
    () => LocationSearchInteractorImpl(dataProvider: sl()),
  );

  //
  // Location
  //

  // Service
  sl.registerLazySingleton<LocationRemoteDataService>(
    () => LocationRemoteDataServiceImpl(apiClient: sl()),
  );

  // DataProvider
  sl.registerLazySingleton<LocationDataProvider>(
    () => LocationDataProviderImpl(service: sl()),
  );

  // Interactor
  sl.registerLazySingleton<LocationInteractor>(
    () => LocationInteractorImpl(dataProvider: sl()),
  );

  // HttpClient
  sl.registerLazySingleton<http.Client>(
    () => http.Client(),
  );

  // ApiClient
  sl.registerLazySingleton<ApiClient>(
    () => ApiClientImpl(client: sl()),
  );

  //
  // Favorite
  //

  // Service
  sl.registerLazySingleton<FavoriteLocalDataService>(
    () => FavoriteLocalDataServiceImpl(dataBaseClient: sl()),
  );

  // DataProvider
  sl.registerLazySingleton<FavoriteDataProvider>(
    () => FavoriteDataProviderImpl(service: sl()),
  );

  // Interactor
  sl.registerLazySingleton<FavoriteInteractor>(
    () => FavoriteInteractorImpl(dataProvider: sl()),
  );

  // DataBase client
  sl.registerSingleton<DataBaseClient>(DataBaseClient.instance);
}
