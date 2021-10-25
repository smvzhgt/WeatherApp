import 'package:flutter_test/flutter_test.dart';
import 'package:forecastapp/scenes/location/domain/entities/forecast_entity.dart';
import 'package:forecastapp/scenes/location/domain/entities/parent_entity.dart';
import 'package:forecastapp/scenes/location/domain/entities/source_entity.dart';
import 'package:forecastapp/scenes/location/domain/entities/weather_entity.dart';
import 'package:mockito/mockito.dart';

import '../../../../all_test.mocks.dart';

void main() {
  late MockForecastEntity entity;

  setUp(() {
    entity = MockForecastEntity();
  });

  group("Forecast model", () {
    test("should be a right type", () {
      expect(entity, isA<ForecastEntity>());
    });

    test("should be fields a right type and data", () {
      const tParentEntity = ParentEntity.empty();
      const tSourceEntity = SourceEntity.empty();
      const tWeatherEntity = WeatherEntity.empty();

      when(entity.consolidatedWeather).thenReturn([tWeatherEntity]);
      expect(entity.consolidatedWeather, [tWeatherEntity]);
      expect(entity.consolidatedWeather.first, tWeatherEntity);
      expect(entity.consolidatedWeather.length, 1);
      expect(entity.consolidatedWeather, isA<List<WeatherEntity>>());

      when(entity.title).thenReturn("Kharkiv");
      expect(entity.title, "Kharkiv");
      expect(entity.title, isA<String>());

      when(entity.locationType).thenReturn("City");
      expect(entity.locationType, "City");
      expect(entity.locationType, isA<String>());

      when(entity.woeid).thenReturn(55);
      expect(entity.woeid, 55);
      expect(entity.woeid, isA<int>());

      when(entity.lattLong).thenReturn("49.990101,36.230301");
      expect(entity.lattLong, "49.990101,36.230301");
      expect(entity.lattLong, isA<String>());

      when(entity.timezone).thenReturn("Europe/Kiev");
      expect(entity.timezone, "Europe/Kiev");
      expect(entity.timezone, isA<String>());

      when(entity.time).thenReturn("2021-08-24T17:44:12.508764+03:00");
      expect(entity.time, "2021-08-24T17:44:12.508764+03:00");
      expect(entity.time, isA<String>());

      when(entity.sunRise).thenReturn("2021-08-24T05:38:11.963607+03:00");
      expect(entity.sunRise, "2021-08-24T05:38:11.963607+03:00");
      expect(entity.sunRise, isA<String>());

      when(entity.sunSet).thenReturn("2021-08-24T19:35:36.249847+03:00");
      expect(entity.sunSet, "2021-08-24T19:35:36.249847+03:00");
      expect(entity.sunSet, isA<String>());

      when(entity.timezoneName).thenReturn("LMT");
      expect(entity.timezoneName, "LMT");
      expect(entity.timezoneName, isA<String>());

      when(entity.parent).thenReturn(tParentEntity);
      expect(entity.parent, tParentEntity);
      expect(entity.parent, isA<ParentEntity>());

      when(entity.sources).thenReturn([tSourceEntity]);
      expect(entity.sources, [tSourceEntity]);
      expect(entity.sources.first, tSourceEntity);
      expect(entity.sources.length, 1);
      expect(entity.sources, isA<List<SourceEntity>>());
    });
  });
}
