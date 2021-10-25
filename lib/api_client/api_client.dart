import 'dart:convert';

import 'package:flutter/foundation.dart';
import 'package:http/http.dart' as http;

import '../core/error/exceptions.dart';
import '../scenes/location/data/models/forecast_model.dart';
import '../scenes/location_search/data/models/location_search_model.dart';

abstract class ApiClient {
  Future<List<LocationSearchModel>> fetchEarthID(String query);
  Future<ForecastModel> fetchForecastData(int earthID);
}

class ApiClientImpl implements ApiClient {
  http.Client client;
  static const String _baseUrl = "www.metaweather.com";

  ApiClientImpl({
    required this.client,
  });

  static List<LocationSearchModel> parseJsonLocationSearchModel(
      String stringBody) {
    final List<dynamic> decodedList = jsonDecode(stringBody);
    return decodedList.map((e) => LocationSearchModel.fromJson(e)).toList();
  }

  static ForecastModel parseJsonForecastData(String stringBody) {
    final decodedMap = jsonDecode(stringBody);
    return ForecastModel.fromJson(decodedMap);
  }

  @override
  Future<List<LocationSearchModel>> fetchEarthID(String query) async {
    var url = Uri.https(
      _baseUrl,
      '/api/location/search/',
      {'query': query},
    );

    final response = await client.get(url);
    if (response.statusCode == 200) {
      return compute(parseJsonLocationSearchModel, response.body);
    } else {
      throw ServerException();
    }
  }

  @override
  Future<ForecastModel> fetchForecastData(int earthID) async {
    var url = Uri.https(
      _baseUrl,
      '/api/location/$earthID/',
    );

    final response = await client.get(url);
    if (response.statusCode == 200) {
      return compute(parseJsonForecastData, response.body);
    } else {
      throw ServerException();
    }
  }
}
