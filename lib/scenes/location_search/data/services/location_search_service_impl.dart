import 'package:forecastapp/db/data_base_client.dart';

import '../../../../api_client/api_client.dart';
import '../models/location_search_model.dart';

abstract class LocationSearchService {
  Future<List<LocationSearchModel>> fetchEarthID(String query);
  Future<LocationSearchModel> saveLocationSearch(
    LocationSearchModel location,
  );
  Future<int> deleteLocationSearch(
    LocationSearchModel location,
  );
  Future<LocationSearchModel?> readLocationSearch(
    LocationSearchModel location,
  );
}

class LocationSearchServiceImpl implements LocationSearchService {
  final ApiClient apiClient;
  final DataBaseClient dataBaseClient;

  LocationSearchServiceImpl({
    required this.apiClient,
    required this.dataBaseClient,
  });

  @override
  Future<List<LocationSearchModel>> fetchEarthID(
    String query,
  ) async {
    return apiClient.fetchEarthID(query);
  }

  @override
  Future<LocationSearchModel> saveLocationSearch(
    LocationSearchModel location,
  ) async {
    return dataBaseClient.create(location);
  }

  @override
  Future<int> deleteLocationSearch(
    LocationSearchModel location,
  ) async {
    final id = location.id ?? 0;
    return await dataBaseClient.delete(id);
  }

  @override
  Future<LocationSearchModel?> readLocationSearch(
    LocationSearchModel location,
  ) async {
    final id = location.id ?? 0;
    return await dataBaseClient.read(id);
  }
}
