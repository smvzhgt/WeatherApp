import 'package:dartz/dartz.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:forecastapp/scenes/location/domain/entities/forecast_entity.dart';
import 'package:forecastapp/scenes/location/domain/interactors/location_interactor_impl.dart';
import 'package:mockito/mockito.dart';

import '../../../../all_test.mocks.dart';

main() {
  late LocationInteractorImpl interactor;
  late MockLocationDataProvider dataProvider;

  setUp(() {
    dataProvider = MockLocationDataProvider();
    interactor = LocationInteractorImpl(dataProvider: dataProvider);
  });

  group('LocationInteractor test', () {
    const tForecastEntity = ForecastEntity.empty();
    const earthId = 3214;
    test('Should return ForecastEntity', () async {
      when(dataProvider.fetchForecastData(earthId))
          .thenAnswer((_) async => const Right(tForecastEntity));

      final result = await interactor.fetchForecastData(earthId);

      expect(result, const Right(tForecastEntity));
      verify(dataProvider.fetchForecastData(earthId));
      verifyNoMoreInteractions(dataProvider);
    });
  });
}
