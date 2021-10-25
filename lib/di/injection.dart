import 'package:get_it/get_it.dart';
import 'package:http/http.dart' as http;

import '../api_client/api_client.dart';
import '../scenes/location/data/data_providers/location_data_provider_impl.dart';
import '../scenes/location/data/services/location_service.dart';
import '../scenes/location/domain/data_providers/location_data_provider.dart';
import '../scenes/location/domain/interactors/location_interactor_impl.dart';
import '../scenes/location_search/data/data_providers/location_search_data_provider_impl.dart';
import '../scenes/location_search/data/services/location_search_service_impl.dart';
import '../scenes/location_search/domain/data_providers/location_search_data_provider.dart';
import '../scenes/location_search/domain/interactors/location_search_interactor_impl.dart';

final sl = GetIt.instance;

void init() {
  // LocationSearch

  // Service
  sl.registerLazySingleton<LocationSearchService>(
      () => LocationSearchServiceImpl(apiClient: sl()));

  // DataProvider
  sl.registerLazySingleton<LocationSearchDataProvider>(
      () => LocationSearchDataProviderImpl(service: sl()));

  // Interactor
  sl.registerLazySingleton<LocationSearchInteractor>(
      () => LocationSearchInteractorImpl(dataProvider: sl()));

  // Location

  // Service
  sl.registerLazySingleton<LocationService>(
      () => LocationServiceImpl(apiClient: sl()));

  // DataProvider
  sl.registerLazySingleton<LocationDataProvider>(
      () => LocationDataProviderImpl(service: sl()));

  // Interactor
  sl.registerLazySingleton<LocationInteractor>(
      () => LocationInteractorImpl(dataProvider: sl()));

  // HttpClient
  sl.registerLazySingleton<http.Client>(() => http.Client());

  // ApiClient
  sl.registerLazySingleton<ApiClient>(() => ApiClientImpl(client: sl()));
}
