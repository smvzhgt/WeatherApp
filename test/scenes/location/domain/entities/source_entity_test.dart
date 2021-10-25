import 'package:flutter_test/flutter_test.dart';
import 'package:forecastapp/scenes/location/domain/entities/source_entity.dart';
import 'package:mockito/mockito.dart';

import '../../../../all_test.mocks.dart';

void main() {
  late MockSourceEntity entity;

  setUp(() {
    entity = MockSourceEntity();
  });

  group('SourceEntity', () {
    test('should be a right type', () async {
      expect(entity, isA<SourceEntity>());
    });

    test('should be fields a right type and data', () async {
      when(entity.title).thenReturn('BBC');

      expect(entity.title, "BBC");
      expect(entity.title, isA<String>());

      when(entity.slug).thenReturn('bbc');

      expect(entity.slug, "bbc");
      expect(entity.slug, isA<String>());

      when(entity.url).thenReturn('http://www.bbc.co.uk/weather/');

      expect(entity.url, "http://www.bbc.co.uk/weather/");
      expect(entity.url, isA<String>());

      when(entity.crawlRate).thenReturn(360);

      expect(entity.crawlRate, 360);
      expect(entity.crawlRate, isA<int>());
    });
  });
}
