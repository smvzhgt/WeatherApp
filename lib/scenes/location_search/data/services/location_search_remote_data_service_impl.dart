import '../../../../api_client/api_client.dart';
import '../models/location_search_model.dart';

abstract class LocationSearchRemoteDataService {
  Future<List<LocationSearchModel>> fetchEarthID(String query);
}

class LocationSearchRemoteDataServiceImpl
    implements LocationSearchRemoteDataService {
  final ApiClient apiClient;

  LocationSearchRemoteDataServiceImpl({
    required this.apiClient,
  });

  @override
  Future<List<LocationSearchModel>> fetchEarthID(
    String query,
  ) async {
    return apiClient.fetchEarthID(query);
  }
}
