import 'package:dartz/dartz.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:forecastapp/scenes/location_search/domain/entities/location_search_entity.dart';
import 'package:forecastapp/scenes/location_search/domain/interactors/location_search_interactor_impl.dart';
import 'package:mockito/mockito.dart';

import '../../../../all_test.mocks.dart';

main() {
  late LocationSearchInteractorImpl interactor;
  late MockLocationSearchDataProvider dataProvider;
  final tEntity = LocationSearch(
    title: 'Moscow',
    locationType: 'City',
    woeid: 12345,
    isFavorite: false,
  );
  final tListEntities = [tEntity];
  const query = 'kharkiv';

  setUp(() {
    dataProvider = MockLocationSearchDataProvider();
    interactor = LocationSearchInteractorImpl(dataProvider: dataProvider);
  });

  group('LocationSearchInteractor test', () {
    test('Should return Earth ID', () async {
      when(dataProvider.fetchEarthID(query))
          .thenAnswer((realInvocation) async => Right(tListEntities));

      final result = await interactor.fetchEarthID(query: query);

      expect(result, Right(tListEntities));
      verify(dataProvider.fetchEarthID(query));
      verifyNoMoreInteractions(dataProvider);
    });
  });
}
