import 'package:flutter_test/flutter_test.dart';
import 'package:forecastapp/scenes/location_search/domain/entities/location_search_entity.dart';
import 'package:mockito/mockito.dart';

import '../../../../all_test.mocks.dart';

void main() {
  late LocationSearch entity;

  setUp(() {
    entity = MockLocationSearch();
  });
  group('LocationSearch entity', () {
    test('Entity is right type', () {
      expect(entity, isA<LocationSearch>());
    });

    test('Entity test type fields', () {
      when(entity.title).thenReturn('Kharkiv');
      expect(entity.title, 'Kharkiv');
      expect(entity.title, isA<String>());

      when(entity.locationType).thenReturn('City');
      expect(entity.locationType, 'City');
      expect(entity.locationType, isA<String>());

      when(entity.woeid).thenReturn(922137);
      expect(entity.woeid, 922137);
      expect(entity.woeid, isA<int>());
    });
  });
}
