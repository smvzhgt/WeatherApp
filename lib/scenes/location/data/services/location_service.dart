import '../../../../api_client/api_client.dart';
import '../models/forecast_model.dart';

abstract class LocationService {
  Future<ForecastModel> fetchForecastData(
    int earthID,
  );
}

class LocationServiceImpl implements LocationService {
  final ApiClient apiClient;

  LocationServiceImpl({
    required this.apiClient,
  });

  @override
  Future<ForecastModel> fetchForecastData(
    int earthID,
  ) async {
    return await apiClient.fetchForecastData(earthID);
  }
}
