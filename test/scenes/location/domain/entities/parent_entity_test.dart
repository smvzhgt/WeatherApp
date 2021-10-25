import 'package:flutter_test/flutter_test.dart';
import 'package:forecastapp/scenes/location/domain/entities/parent_entity.dart';
import 'package:mockito/mockito.dart';

import '../../../../all_test.mocks.dart';

void main() {
  late MockParentEntity entity;

  setUp(() {
    entity = MockParentEntity();
  });

  group('ParentEntity', () {
    test('should be a right type', () async {
      expect(entity, isA<ParentEntity>());
    });

    test('should be fields a right type and data', () async {
      when(entity.title).thenReturn('Ukraine');
      expect(entity.title, "Ukraine");
      expect(entity.title, isA<String>());

      when(entity.locationType).thenReturn('Country');
      expect(entity.locationType, "Country");
      expect(entity.locationType, isA<String>());

      when(entity.woeid).thenReturn(23);
      expect(entity.woeid, 23);
      expect(entity.woeid, isA<int>());

      when(entity.lattLong).thenReturn('48.35,31.17');
      expect(entity.lattLong, '48.35,31.17');
      expect(entity.lattLong, isA<String>());
    });
  });
}
