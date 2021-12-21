import '../../../../db/data_base_client.dart';

import '../../../location_search/domain/entities/location_search_entity.dart';

abstract class FavoriteLocalDataService {
  Future<List<LocationSearch>> loadSearchLocations();
  Future<int> deleteLocationSearch(LocationSearch location);
}

class FavoriteLocalDataServiceImpl implements FavoriteLocalDataService {
  final DataBaseClient dataBaseClient;

  FavoriteLocalDataServiceImpl({
    required this.dataBaseClient,
  });

  @override
  Future<List<LocationSearch>> loadSearchLocations() async {
    return await dataBaseClient.readAll();
  }

  @override
  Future<int> deleteLocationSearch(LocationSearch location) async {
    final id = location.woeid;
    return await dataBaseClient.delete(id);
  }
}
