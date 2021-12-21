import 'dart:io';

import 'package:dartz/dartz.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:forecastapp/core/error/exceptions.dart';
import 'package:forecastapp/core/error/failure.dart';
import 'package:forecastapp/scenes/location_search/data/data_providers/location_search_data_provider_impl.dart';
import 'package:forecastapp/scenes/location_search/data/models/location_search_model.dart';
import 'package:forecastapp/scenes/location_search/domain/data_providers/location_search_data_provider.dart';
import 'package:mockito/mockito.dart';

import '../../../../all_test.mocks.dart';

main() {
  late LocationSearchDataProvider dataProvider;
  late MockLocationSearchServiceImpl mockService;
  final tModel = LocationSearchModel(
    title: 'Kharkiv',
    locationType: 'City',
    woeid: 123,
    isFavorite: false,
  );
  const query = 'kharkiv';
  final tListModels = [tModel];

  setUp(() {
    mockService = MockLocationSearchServiceImpl();
    dataProvider = LocationSearchDataProviderImpl(remoteDataService: mockService);
  });

  group('LocationSearchDataProviderImpl', () {
    test('should return data when request successful', () async {
      when(mockService.fetchEarthID(query))
          .thenAnswer((_) async => Future.value(tListModels));

      final result = await dataProvider.fetchEarthID(query);

      verify(mockService.fetchEarthID(query));
      expect(result, Right(tListModels));
    });

    test('should return failure when request unsuccessful', () async {
      when(mockService.fetchEarthID(query)).thenThrow(ServerException());

      final result = await dataProvider.fetchEarthID(query);

      verify(mockService.fetchEarthID(query));
      expect(result, Left(ServerFailure()));
    });

    test('should return socket failure when device s offline', () async {
      when(mockService.fetchEarthID(query))
          .thenThrow(const SocketException('No internet connection'));

      final result = await dataProvider.fetchEarthID(query);

      verify(mockService.fetchEarthID(query));
      expect(result, Left(SocketFailure()));
    });
  });
}
