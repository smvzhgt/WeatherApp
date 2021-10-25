import 'package:flutter_test/flutter_test.dart';
import 'package:forecastapp/scenes/location/domain/entities/weather_entity.dart';
import 'package:mockito/mockito.dart';

import '../../../../all_test.mocks.dart';

void main() {
  late MockWeatherEntity model;

  setUp(() {
    model = MockWeatherEntity();
  });

  group("WeatherEntity", () {
    test("should be a right type", () {
      expect(model, isA<WeatherEntity>());
    });

    test("should be fields a right type and data", () {
      when(model.id).thenReturn(1);
      expect(model.id, 1);
      expect(model.id, isA<int>());

      when(model.weatherStateName).thenReturn("Heavy Cloud");
      expect(model.weatherStateName, "Heavy Cloud");
      expect(model.weatherStateName, isA<String>());

      when(model.weatherStateAbbr).thenReturn("hc");
      expect(model.weatherStateAbbr, "hc");
      expect(model.weatherStateAbbr, isA<String>());

      when(model.windDirectionCompass).thenReturn("ENE");
      expect(model.windDirectionCompass, "ENE");
      expect(model.windDirectionCompass, isA<String>());

      when(model.created).thenReturn('2021-08-24T14:33:23.558954Z');
      expect(model.created, '2021-08-24T14:33:23.558954Z');
      expect(model.created, isA<String>());

      when(model.applicableDate).thenReturn("2021-08-29");
      expect(model.applicableDate, "2021-08-29");
      expect(model.applicableDate, isA<String>());

      when(model.minTemp).thenReturn(18.18);
      expect(model.minTemp, 18.18);
      expect(model.minTemp, isA<double>());

      when(model.maxTemp).thenReturn(32.03);
      expect(model.maxTemp, 32.03);
      expect(model.maxTemp, isA<double>());

      when(model.theTemp).thenReturn(29.79);
      expect(model.theTemp, 29.79);
      expect(model.theTemp, isA<double>());

      when(model.windSpeed).thenReturn(3.70);
      expect(model.windSpeed, 3.70);
      expect(model.windSpeed, isA<double>());

      when(model.windDirection).thenReturn(70.5);
      expect(model.windDirection, 70.5);
      expect(model.windDirection, isA<double>());

      when(model.airPressure).thenReturn(1013.0);
      expect(model.airPressure, 1013.0);
      expect(model.airPressure, isA<double>());

      when(model.humidity).thenReturn(51);
      expect(model.humidity, 51);
      expect(model.humidity, isA<int>());

      when(model.visibility).thenReturn(9.9);
      expect(model.visibility, 9.9);
      expect(model.visibility, isA<double>());

      when(model.predictability).thenReturn(9);
      expect(model.predictability, 9);
      expect(model.predictability, isA<int>());
    });
  });
}
