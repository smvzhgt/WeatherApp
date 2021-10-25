import 'dart:convert';

import 'package:flutter_test/flutter_test.dart';
import 'package:forecastapp/api_client/api_client.dart';
import 'package:forecastapp/scenes/location/data/models/forecast_model.dart';
import 'package:forecastapp/scenes/location/data/models/parent_model.dart';
import 'package:forecastapp/scenes/location/data/models/source_model.dart';
import 'package:forecastapp/scenes/location/data/models/weather_model.dart';
import 'package:forecastapp/scenes/location_search/data/models/location_search_model.dart';
import 'package:http/http.dart' as http;
import 'package:mockito/mockito.dart';

import '../all_test.mocks.dart';
import '../json_files/local_json_reader.dart';

void main() async {
  late HttpMockClient httpMockClient;
  late MockApiClientImpl mockApiClient;
  const url = 'https://example.com';
  const statusCodeSuccess = 200;

  setUp(() {
    httpMockClient = HttpMockClient();
    mockApiClient = MockApiClientImpl();
  });

  group('http.Client', () {
    test('''should return successful response 
        when GET method completes successfully''', () async {
      final response = http.Response('{}', 200);
      when(httpMockClient.get(Uri.parse(url)))
          .thenAnswer((_) async => response);

      final result = await httpMockClient.get(Uri.parse(url));

      expect(result.statusCode, statusCodeSuccess);
    });

    test("should throws an exception when GET method completes with an error",
        () async {
      const statusCodeError = 404;
      final response = http.Response('{}', statusCodeError);
      when(httpMockClient.get(Uri.parse(url)))
          .thenAnswer((_) async => response);

      final result = await httpMockClient.get(Uri.parse(url));

      expect(result.statusCode, statusCodeError);
    });

    test('should return list of model when response code 200', () async {
      final dataFromFile =
          FileReader().readJson('location_search_list_one_item');
      final List<dynamic> tResultList = jsonDecode(dataFromFile);
      final tResponseList =
          tResultList.map((e) => LocationSearchModel.fromJson(e)).toList();

      final response = http.Response(dataFromFile, statusCodeSuccess);

      when(httpMockClient.get(Uri.parse(url)))
          .thenAnswer((_) async => response);

      final result = await httpMockClient.get(Uri.parse(url));

      final List<dynamic> responseList = jsonDecode(result.body);
      final responseResult =
          responseList.map((e) => LocationSearchModel.fromJson(e)).toList();

      expect(responseResult, tResponseList);
    });
  });

  group('ApiClient', () {
    group('LocationSearch', () {
      test('should return LocationSearchModel type', () async {
        const model = LocationSearchModel(
          title: '',
          locationType: '',
          woeid: 0,
        );
        const query = 'kharkiv';

        when(mockApiClient.fetchEarthID(query))
            .thenAnswer((_) async => Future.value([model]));

        final result = await mockApiClient.fetchEarthID(query);
        expect(result, isA<List<LocationSearchModel>>());
      });

      test('should return List<LocationSearchModel> type', () async {
        final tDataFromFile =
            FileReader().readJson('location_search_list_one_item');
        const url =
            'https://www.metaweather.com/api/location/search/?query=san';
        final List<dynamic> tResultList = jsonDecode(tDataFromFile);
        final tResponseList =
            tResultList.map((e) => LocationSearchModel.fromJson(e)).toList();
        const query = 'san';
        final tResponse = http.Response(tDataFromFile, statusCodeSuccess);

        when(httpMockClient.get(Uri.parse(url)))
            .thenAnswer((_) async => tResponse);

        final apiClient = ApiClientImpl(client: httpMockClient);

        final result = await apiClient.fetchEarthID(query);

        expect(result, isA<List<LocationSearchModel>>());
        expect(result, tResponseList);
        verify(httpMockClient.get(Uri.parse(url)));
      });
    });

    group('Location', () {
      test('should return ForecastModel type', () async {
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
        const earthID = 1234567;
        when(mockApiClient.fetchForecastData(earthID))
            .thenAnswer((_) async => Future.value(tForecastModel));

        final result = await mockApiClient.fetchForecastData(earthID);
        expect(result, isA<ForecastModel>());
      });

      test('should return ForecastModel type', () async {
        final dataFromFile = FileReader().readJson('forecast_item');
        const url = "https://www.metaweather.com/api/location/922137/";
        final resultData = jsonDecode(dataFromFile);
        final tResponseModel = ForecastModel.fromJson(resultData);
        const earthID = 922137;
        final tResponse = http.Response(dataFromFile, statusCodeSuccess);

        when(httpMockClient.get(Uri.parse(url)))
            .thenAnswer((_) async => tResponse);

        final apiClient = ApiClientImpl(client: httpMockClient);

        final result = await apiClient.fetchForecastData(earthID);

        expect(result, isA<ForecastModel>());
        expect(result, tResponseModel);
        verify(httpMockClient.get(Uri.parse(url)));
      });
    });
  });
}
