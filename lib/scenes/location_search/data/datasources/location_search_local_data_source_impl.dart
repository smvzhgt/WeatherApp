import 'package:forecastapp/db/data_base_client.dart';

import '../models/location_search_model.dart';

abstract class LocationSearchLocalDataSource {
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

class LocationSearchLocalDataSourceImpl
    implements LocationSearchLocalDataSource {
  final DataBaseClient dataBaseClient;

  LocationSearchLocalDataSourceImpl({
    required this.dataBaseClient,
  });

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
    final id = location.woeid;
    return await dataBaseClient.delete(id);
  }

  @override
  Future<LocationSearchModel?> readLocationSearch(
    LocationSearchModel location,
  ) async {
    final id = location.woeid;
    return await dataBaseClient.read(id);
  }
}
