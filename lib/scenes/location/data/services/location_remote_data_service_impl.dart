import '../../../../api_client/api_client.dart';
import '../models/forecast_model.dart';

abstract class LocationRemoteDataService {
  Future<ForecastModel> fetchForecastData(
    int earthID,
  );
}

class LocationRemoteDataServiceImpl implements LocationRemoteDataService {
  final ApiClient apiClient;

  LocationRemoteDataServiceImpl({
    required this.apiClient,
  });

  @override
  Future<ForecastModel> fetchForecastData(
    int earthID,
  ) async {
    return await apiClient.fetchForecastData(earthID);
  }
}
