import 'dart:io';

import 'package:dartz/dartz.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:forecastapp/core/error/exceptions.dart';
import 'package:forecastapp/core/error/failure.dart';
import 'package:forecastapp/scenes/location/data/data_providers/location_data_provider_impl.dart';
import 'package:forecastapp/scenes/location/data/models/forecast_model.dart';
import 'package:forecastapp/scenes/location/data/models/parent_model.dart';
import 'package:forecastapp/scenes/location/data/models/source_model.dart';
import 'package:forecastapp/scenes/location/data/models/weather_model.dart';
import 'package:forecastapp/scenes/location/domain/data_providers/location_data_provider.dart';
import 'package:mockito/mockito.dart';

import '../../../../all_test.mocks.dart';

void main() {
  late MockLocationServiceImpl mockService;
  late LocationDataProvider dataProvider;
  const earthID = 1234567;

  setUp(() {
    mockService = MockLocationServiceImpl();
    dataProvider = LocationDataProviderImpl(remoteDataSource: mockService);
  });

  group('LocationDataProviderImpl', () {
    test('should return data when request successful', () async {
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
          maxTemp: 7.435000000000002,
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
      when(mockService.fetchForecastData(earthID))
          .thenAnswer((_) => Future.value(tForecastModel));

      final result = await dataProvider.fetchForecastData(earthID);

      verify(mockService.fetchForecastData(earthID));
      expect(result, const Right(tForecastModel));
    });

    test('should return failure when request unsuccessful', () async {
      when(mockService.fetchForecastData(earthID)).thenThrow(ServerException());

      final result = await dataProvider.fetchForecastData(earthID);

      verify(mockService.fetchForecastData(earthID));
      expect(result, Left(ServerFailure()));
    });

    test('should return socket failure when device s offline', () async {
      when(mockService.fetchForecastData(earthID))
          .thenThrow(const SocketException('No internet connection'));

      final result = await dataProvider.fetchForecastData(earthID);

      verify(mockService.fetchForecastData(earthID));
      expect(result, Left(SocketFailure()));
    });
  });
}
