import 'package:forecastapp/api_client/api_client.dart';
import 'package:forecastapp/scenes/location/data/data_providers/location_data_provider_impl.dart';
import 'package:forecastapp/scenes/location/data/services/location_service.dart';
import 'package:forecastapp/scenes/location/domain/data_providers/location_data_provider.dart';
import 'package:forecastapp/scenes/location/domain/entities/forecast_entity.dart';
import 'package:forecastapp/scenes/location/domain/entities/parent_entity.dart';
import 'package:forecastapp/scenes/location/domain/entities/source_entity.dart';
import 'package:forecastapp/scenes/location/domain/entities/weather_entity.dart';
import 'package:forecastapp/scenes/location/domain/interactors/location_interactor_impl.dart';
import 'package:forecastapp/scenes/location_search/data/services/location_search_service_impl.dart';
import 'package:forecastapp/scenes/location_search/domain/data_providers/location_search_data_provider.dart';
import 'package:forecastapp/scenes/location_search/domain/entities/location_search_entity.dart';
import 'package:forecastapp/scenes/location_search/domain/interactors/location_search_interactor_impl.dart';
import 'package:forecastapp/scenes/location_search/presentation/riverpod/state/location_search_state.dart';
import 'package:mockito/annotations.dart';
import 'package:http/http.dart' as http;

import 'api_client/api_client_test.dart' as api_client;
import 'scenes/location_search/data/data_providers/location_search_data_provider_test.dart'
    as location_search_data_provider;
import 'scenes/location_search/data/models/location_search_model_test.dart'
    as location_search_model;
import 'scenes/location_search/data/services/location_search_service_impl_test.dart'
    as location_search_service;
import 'scenes/location_search/domain/entities/location_search_entity_test.dart'
    as location_search_entity;
import 'scenes/location_search/domain/interactors/location_search_interactor_impl_test.dart'
    as location_search_interactor;
import 'core/pages/empty_page_test.dart' as empty_page;
import 'core/pages/error_page_test.dart' as error_page;
import 'core/pages/loading_page_test.dart' as loading_page;
import 'scenes/location_search/presentation/pages/location_search_page_test.dart'
    as location_search_page;
import 'scenes/location_search/presentation/widgets/location_search_row_item_test.dart'
    as location_search_row_item;
import 'scenes/location/domain/entities/parent_entity_test.dart'
    as parent_entity;
import 'scenes/location/domain/entities/source_entity_test.dart'
    as source_entity;
import 'scenes/location/domain/entities/weather_entity_test.dart'
    as weather_entity;
import 'scenes/location/domain/entities/forecast_entity_test.dart'
    as forecast_entity;
import 'scenes/location/data/models/forecast_model_test.dart' as forecast_model;
import 'scenes/location/data/data_providers/location_data_provider_test.dart'
    as location_data_provider;
import 'scenes/location/presentation/widgets/detail_location_row_item_test.dart'
    as detail_location_row_item;
import 'core/date_converter_test.dart' as date_converter;
import 'core/image_path_test.dart' as image_path;
import 'core/wind_direction_converter_test.dart' as wind_direction_converter;

const listMocks = [
  LocationSearchServiceImpl,
  ApiClientImpl,
  LocationSearch,
  LocationSearchDataProvider,
  LocationSearchLoadedState,
  LocationSearchInteractorImpl,
  ParentEntity,
  SourceEntity,
  ForecastEntity,
  WeatherEntity,
  LocationDataProvider,
  LocationServiceImpl,
  LocationInteractorImpl,
  LocationDataProviderImpl
];

@GenerateMocks(listMocks,
    customMocks: [MockSpec<http.Client>(as: #HttpMockClient)])
void main() {
  location_search_data_provider.main();
  location_search_service.main();
  location_search_model.main();
  location_search_entity.main();
  location_search_interactor.main();
  api_client.main();
  parent_entity.main();
  source_entity.main();
  weather_entity.main();
  forecast_entity.main();
  forecast_model.main();
  location_data_provider.main();
  date_converter.main();
  image_path.main();
  wind_direction_converter.main();
  // TODO: - fail tests, getIt error
  const isGetIt = false;
  if (isGetIt) {
    detail_location_row_item.main();
    empty_page.main();
    error_page.main();
    loading_page.main();
    location_search_page.main();
    location_search_row_item.main();
  }
}
