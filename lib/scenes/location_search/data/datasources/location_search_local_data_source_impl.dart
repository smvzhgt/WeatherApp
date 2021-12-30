import 'package:forecastapp/db/data_base_client.dart';

import '../models/location_search_model.dart';

abstract class LocationSearchLocalDataSource {
  Future<LocationSearchModel> putLocationSearch(
    LocationSearchModel location,
  );
  Future<int> deleteLocationSearch(
    int id,
  );
  Future<LocationSearchModel?> getLocationSearch(
    int id,
  );
}

class LocationSearchLocalDataSourceImpl
    implements LocationSearchLocalDataSource {
  final DataBaseClient dataBaseClient;

  LocationSearchLocalDataSourceImpl({
    required this.dataBaseClient,
  });

  @override
  Future<LocationSearchModel> putLocationSearch(
    LocationSearchModel location,
  ) async {
    return dataBaseClient.create(location);
  }

  @override
  Future<int> deleteLocationSearch(
    int id,
  ) async {
    return await dataBaseClient.delete(id);
  }

  @override
  Future<LocationSearchModel?> getLocationSearch(
    int id,
  ) async {
    return await dataBaseClient.read(id);
  }
}
