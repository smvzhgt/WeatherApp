import 'package:flutter_test/flutter_test.dart';
import 'package:forecastapp/scenes/location_search/data/models/location_search_model.dart';
import 'package:forecastapp/scenes/location_search/data/services/location_search_service_impl.dart';
import 'package:mockito/mockito.dart';

import '../../../../all_test.mocks.dart';

main() {
  group('Location Search Service', () {
    late MockApiClientImpl mockApiClient;
    late LocationSearchService service;
    const tModel = LocationSearchModel(
      title: 'Kharkiv',
      locationType: 'City',
      woeid: 12345,
    );
    final tListModels = [tModel];
    const query = 'kharkiv';

    setUp(() {
      mockApiClient = MockApiClientImpl();
      service = LocationSearchServiceImpl(apiClient: mockApiClient);
    });

    test('should return data when request successful', () async {
      when(mockApiClient.fetchEarthID(query))
          .thenAnswer((_) async => Future.value(tListModels));

      final result = await service.fetchEarthID(query);

      verify(mockApiClient.fetchEarthID(query));
      expect(result, tListModels);
    });
  });
}
