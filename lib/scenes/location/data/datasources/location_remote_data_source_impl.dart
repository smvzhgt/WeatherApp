import '../../../../api_client/api_client.dart';
import '../models/forecast_model.dart';

abstract class LocationRemoteDataSource {
  Future<ForecastModel> fetchForecastData(
    int earthID,
  );
}

class LocationRemoteDataSourceImpl implements LocationRemoteDataSource {
  final ApiClient apiClient;

  LocationRemoteDataSourceImpl({
    required this.apiClient,
  });

  @override
  Future<ForecastModel> fetchForecastData(
    int earthID,
  ) async {
    return await apiClient.fetchForecastData(earthID);
  }
}
