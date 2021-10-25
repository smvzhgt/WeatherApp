import '../../../../api_client/api_client.dart';
import '../models/location_search_model.dart';

abstract class LocationSearchService {
  Future<List<LocationSearchModel>> fetchEarthID(
    String query,
  );
}

class LocationSearchServiceImpl implements LocationSearchService {
  final ApiClient apiClient;

  LocationSearchServiceImpl({
    required this.apiClient,
  });

  @override
  Future<List<LocationSearchModel>> fetchEarthID(
    String query,
  ) async {
    return apiClient.fetchEarthID(query);
  }
}
