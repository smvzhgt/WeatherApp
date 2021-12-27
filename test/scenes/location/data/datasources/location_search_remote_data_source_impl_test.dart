import 'package:flutter_test/flutter_test.dart';
import 'package:forecastapp/scenes/location/data/datasources/location_remote_data_source_impl.dart';
import 'package:forecastapp/scenes/location/data/models/forecast_model.dart';
import 'package:forecastapp/scenes/location/data/models/parent_model.dart';
import 'package:forecastapp/scenes/location/data/models/source_model.dart';
import 'package:forecastapp/scenes/location/data/models/weather_model.dart';
import 'package:mockito/mockito.dart';

import '../../../../all_test.mocks.dart';

main() {
  group('Location Remote Data Source', () {
    late MockApiClientImpl mockApiClient;
    late LocationRemoteDataSource remoteDataSource;
    const earthID = 1234567;

    setUp(() {
      mockApiClient = MockApiClientImpl();
      remoteDataSource = LocationRemoteDataSourceImpl(apiClient: mockApiClient);
    });

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
      when(mockApiClient.fetchForecastData(earthID))
          .thenAnswer((_) async => Future.value(tForecastModel));

      final result = await remoteDataSource.fetchForecastData(earthID);

      verify(mockApiClient.fetchForecastData(earthID));
      expect(result, tForecastModel);
    });
  });
}
