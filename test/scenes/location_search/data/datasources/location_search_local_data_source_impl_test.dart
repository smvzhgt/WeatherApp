import 'package:flutter_test/flutter_test.dart';
import 'package:forecastapp/scenes/location_search/data/datasources/location_search_database_data_source_impl.dart';
import 'package:forecastapp/scenes/location_search/data/models/location_search_model.dart';
import 'package:mockito/mockito.dart';

import '../../../../all_test.mocks.dart';

main() {
  group('Location Search Local Data Source', () {
    late LocationSearchDataBaseDataSource localDataSource;
    late MockDataBaseClient mockDataBaseClient;
    final tModel = LocationSearchModel(
      title: 'Kharkiv',
      locationType: 'City',
      woeid: 12345,
      isFavorite: false,
    );
    const tIndex = 1;

    setUp(() {
      mockDataBaseClient = MockDataBaseClient();
      localDataSource =
          LocationSearchDataBaseDataSourceImpl(dataBaseClient: mockDataBaseClient);
    });

    test('should create item in db', () async {
      when(mockDataBaseClient.create(tModel))
          .thenAnswer((_) async => Future.value(tModel));

      final result = await localDataSource.putLocationSearch(tModel);

      verify(mockDataBaseClient.create(tModel));
      expect(result, tModel);
    });

    test('should read data from db', () async {
      when(mockDataBaseClient.read(tModel.woeid))
          .thenAnswer((_) async => Future.value(tModel));

      final result = await localDataSource.getLocationSearch(tModel.woeid);

      verify(mockDataBaseClient.read(tModel.woeid));
      expect(result, tModel);
    });

    test('should delete data from db', () async {
      when(mockDataBaseClient.delete(tModel.woeid))
          .thenAnswer((_) async => Future.value(tIndex));

      final result = await localDataSource.deleteLocationSearch(tModel.woeid);

      verify(mockDataBaseClient.delete(tModel.woeid));
      expect(result, tIndex);
    });
  });
}
