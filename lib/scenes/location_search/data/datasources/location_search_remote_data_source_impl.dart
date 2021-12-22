import '../../../../api_client/api_client.dart';
import '../models/location_search_model.dart';

abstract class LocationSearchRemoteDataSource {
  Future<List<LocationSearchModel>> fetchEarthID(String query);
}

class LocationSearchRemoteDataSourceImpl
    implements LocationSearchRemoteDataSource {
  final ApiClient apiClient;

  LocationSearchRemoteDataSourceImpl({
    required this.apiClient,
  });

  @override
  Future<List<LocationSearchModel>> fetchEarthID(
    String query,
  ) async {
    return apiClient.fetchEarthID(query);
  }
}
