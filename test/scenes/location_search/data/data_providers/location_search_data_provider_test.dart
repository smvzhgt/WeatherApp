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
  late MockLocationSearchRemoteDataSourceImpl mockRemoteDataSource;
  late MockLocationSearchLocalDataSourceImpl mockLocalDataSource;
  late MockLocationSearchMemoryDataSourceImpl mockMemoryDataSource;
  final tModel = LocationSearchModel(
    title: 'Kharkiv',
    locationType: 'City',
    woeid: 123,
    isFavorite: false,
  );
  const query = 'kharkiv';
  final tListModels = [tModel];

  setUp(() {
    mockRemoteDataSource = MockLocationSearchRemoteDataSourceImpl();
    mockLocalDataSource = MockLocationSearchLocalDataSourceImpl();
    mockMemoryDataSource = MockLocationSearchMemoryDataSourceImpl();
    dataProvider = LocationSearchDataProviderImpl(
      remoteDataSource: mockRemoteDataSource,
      localDataSource: mockLocalDataSource,
      memoryDataSource: mockMemoryDataSource,
    );
  });

  group('LocationSearchDataProviderImpl', () {
    group('Test fetchEarthID', () {
      test('should return data when request successful', () async {
        when(mockRemoteDataSource.fetchEarthID(query))
            .thenAnswer((_) async => Future.value(tListModels));
        when(mockLocalDataSource.getLocationSearch(tModel))
            .thenAnswer((_) async => Future.value(tModel));
        when(mockMemoryDataSource.getLocations()).thenReturn(tListModels);

        final result = await dataProvider.fetchEarthID(query);

        verify(mockRemoteDataSource.fetchEarthID(query));
        expect(result, Right(tListModels));
      });

      test('should return failure when request unsuccessful', () async {
        when(mockRemoteDataSource.fetchEarthID(query))
            .thenThrow(ServerException());

        final result = await dataProvider.fetchEarthID(query);

        verify(mockRemoteDataSource.fetchEarthID(query));
        expect(result, Left(ServerFailure()));
      });

      test('should return socket failure when device is offline', () async {
        when(mockRemoteDataSource.fetchEarthID(query))
            .thenThrow(const SocketException('No internet connection'));

        final result = await dataProvider.fetchEarthID(query);

        verify(mockRemoteDataSource.fetchEarthID(query));
        expect(result, Left(SocketFailure()));
      });
    });

    test('should store data to memory cache when request successful', () async {
      when(mockRemoteDataSource.fetchEarthID(query))
          .thenAnswer((_) async => Future.value(tListModels));
      when(mockLocalDataSource.getLocationSearch(tModel))
          .thenAnswer((_) async => Future.value(tModel));
      when(mockMemoryDataSource.getLocations()).thenReturn(tListModels);

      when(mockMemoryDataSource.cacheLocations(tListModels)).thenReturn(null);

      await dataProvider.fetchEarthID(query);

      verify(mockRemoteDataSource.fetchEarthID(query));
      verify(mockMemoryDataSource.cacheLocations(tListModels));
    });

    test('should delete data from db when delete from favorite', () async {
      when(mockLocalDataSource.deleteLocationSearch(tModel))
          .thenAnswer((_) async => Future.value(1));
      when(mockMemoryDataSource.getLocations()).thenReturn(tListModels);

      await dataProvider.deleteLocationSearch(tModel);

      verify(mockLocalDataSource.deleteLocationSearch(tModel));
    });
  });
}
