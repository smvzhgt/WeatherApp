import 'package:flutter_test/flutter_test.dart';
import 'package:forecastapp/scenes/location_search/data/datasources/location_search_remote_data_source_impl.dart';
import 'package:forecastapp/scenes/location_search/data/models/location_search_model.dart';
import 'package:mockito/mockito.dart';

import '../../../../all_test.mocks.dart';

main() {
  group('Location Search Remote Data Source', () {
    late MockApiClientImpl mockApiClient;
    late LocationSearchRemoteDataSource remoteDataSource;
    final tModel = LocationSearchModel(
      title: 'Kharkiv',
      locationType: 'City',
      woeid: 12345,
      isFavorite: false,
    );
    final tListModels = [tModel];
    const query = 'kharkiv';

    setUp(() {
      mockApiClient = MockApiClientImpl();
      remoteDataSource =
          LocationSearchRemoteDataSourceImpl(apiClient: mockApiClient);
    });

    test('should return data when request successful', () async {
      when(mockApiClient.fetchEarthID(query))
          .thenAnswer((_) async => Future.value(tListModels));

      final result = await remoteDataSource.fetchEarthID(query);

      verify(mockApiClient.fetchEarthID(query));
      expect(result, tListModels);
    });
  });
}
