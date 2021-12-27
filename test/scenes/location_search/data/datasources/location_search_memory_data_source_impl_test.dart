import 'package:flutter_test/flutter_test.dart';
import 'package:forecastapp/scenes/location_search/data/datasources/location_search_memory_data_source_impl.dart';
import 'package:forecastapp/scenes/location_search/data/models/location_search_model.dart';

main() {
  group('Location Search Memory Data Source', () {
    late LocationSearchMemoryDataSource memoryDataSource;
    final tModel = LocationSearchModel(
      title: 'Kharkiv',
      locationType: 'City',
      woeid: 12345,
      isFavorite: false,
    );
    final tListModels = [tModel];

    setUp(() {
      memoryDataSource = LocationSearchMemoryDataSourceImpl();
    });

    test('should save data to memory cache', () async {
      expect(memoryDataSource.getLocations().length, 0);
      memoryDataSource.cacheLocations(tListModels);
      expect(memoryDataSource.getLocations().length, 1);
    });

    test('should get data from memory cache', () async {
      expect(memoryDataSource.getLocations(), []);
      memoryDataSource.cacheLocations(tListModels);
      expect(memoryDataSource.getLocations(), tListModels);
    });

    test('should update data in memory cache', () async {
      final tUpdatedModel = LocationSearchModel(
        title: 'Kharkiv',
        locationType: 'City',
        woeid: 12345,
        isFavorite: true,
      );
      expect(memoryDataSource.getLocations(), []);
      memoryDataSource.cacheLocations(tListModels);
      expect(memoryDataSource.getLocations().first.isFavorite, false);
      memoryDataSource.updateLocation(tUpdatedModel);
      expect(memoryDataSource.getLocations().first.isFavorite, true);
    });
  });
}
