import 'dart:convert';

import 'package:flutter_test/flutter_test.dart';
import 'package:forecastapp/scenes/location/data/models/forecast_model.dart';
import 'package:forecastapp/scenes/location/data/models/parent_model.dart';
import 'package:forecastapp/scenes/location/data/models/source_model.dart';
import 'package:forecastapp/scenes/location/data/models/weather_model.dart';

import '../../../../json_files/local_json_reader.dart';

void main() {
  group('ForecastModel', () {
    const sourceModel = SourceModel(
      title: "BBC",
      slug: "bbc",
      url: "http://www.bbc.co.uk/weather/",
      crawlRate: 360,
    );
    const parent = ParentModel(
      title: "Ukraine",
      locationType: "Country",
      woeid: 23424976,
      lattLong: "48.382881,31.173441",
    );
    const weatherModel = WeatherModel(
        id: 6252481974632448,
        weatherStateName: "Heavy Cloud",
        weatherStateAbbr: "hc",
        windDirectionCompass: "E",
        created: "2021-08-24T14:33:07.964603Z",
        applicableDate: "2021-08-24",
        minTemp: 14.56,
        maxTemp: 27.435000000000002,
        theTemp: 25.96,
        windSpeed: 2.9785608048993875,
        windDirection: 82.5,
        airPressure: 1019.0,
        humidity: 33,
        visibility: 9.999726596675416,
        predictability: 71);
    const tForecastModel = ForecastModel(
      consolidatedWeather: [weatherModel],
      title: "Kharkiv",
      locationType: "City",
      woeid: 922137,
      lattLong: "49.990101,36.230301",
      timezone: "Europe/Kiev",
      time: "2021-08-24T17:44:12.508764+03:00",
      sunRise: "2021-08-24T05:38:11.963607+03:00",
      sunSet: "2021-08-24T19:35:36.249847+03:00",
      timezoneName: "LMT",
      parent: parent,
      sources: [sourceModel],
    );

    test('Should be a right type', () async {
      expect(tForecastModel, isA<ForecastModel>());
    });

    test('Should be a right WeatherModel field type', () async {
      expect(weatherModel.id, isA<int>());
      expect(weatherModel.weatherStateName, isA<String>());
      expect(weatherModel.weatherStateAbbr, isA<String>());
      expect(weatherModel.windDirectionCompass, isA<String>());
      expect(weatherModel.created, isA<String>());
      expect(weatherModel.applicableDate, isA<String>());
      expect(weatherModel.minTemp, isA<double>());
      expect(weatherModel.maxTemp, isA<double>());
      expect(weatherModel.theTemp, isA<double>());
      expect(weatherModel.windSpeed, isA<double>());
      expect(weatherModel.windDirection, isA<double>());
      expect(weatherModel.airPressure, isA<double>());
      expect(weatherModel.humidity, isA<int>());
      expect(weatherModel.visibility, isA<double>());
      expect(weatherModel.predictability, isA<int>());
    });

    test('Should return a valid result', () async {
      final dataFromFile = FileReader().readJson('forecast_item');
      final Map<String, dynamic> jsonMap = json.decode(dataFromFile);

      final result = ForecastModel.fromJson(jsonMap);

      expect(result, tForecastModel);
    });
  });
}
