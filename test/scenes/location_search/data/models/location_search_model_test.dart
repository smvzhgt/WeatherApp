import 'dart:convert';

import 'package:flutter_test/flutter_test.dart';
import 'package:forecastapp/scenes/location_search/data/models/location_search_model.dart';
import 'package:forecastapp/scenes/location_search/domain/entities/location_search_entity.dart';

import '../../../../json_files/local_json_reader.dart';

main() {
  group('LocationSearchModel', () {
    const tLocationSearchModel = LocationSearchModel(
      title: 'Kharkiv',
      locationType: 'City',
      woeid: 922137,
    );

    test('Should be a right type', () async {
      expect(tLocationSearchModel, isA<LocationSearch>());
    });

    test('Should return a valid result', () async {
      final dataFromFile = FileReader().readJson('location_search_item');
      final Map<String, dynamic> jsonMap = json.decode(dataFromFile);

      final result = LocationSearchModel.fromJson(jsonMap);

      expect(result, tLocationSearchModel);
    });
  });
}
