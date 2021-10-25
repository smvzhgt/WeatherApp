import 'package:flutter_test/flutter_test.dart';
import 'package:forecastapp/core/wind_direction_converter.dart';

void main() {
  late WindDirectionConverter converter;

  setUp(() {
    converter = WindDirectionConverter();
  });

  group('WindDirectionConverter', () {
    test('should return right string when input symbols', () async {
      expect(converter.convert("N"), "North");
      expect(converter.convert("NNE"), "North North East");
      expect(converter.convert("NE"), "North East");
      expect(converter.convert("ENE"), "East North East");
      expect(converter.convert("E"), "East");
      expect(converter.convert("ESE"), "East South East");
      expect(converter.convert("SE"), "South East");
      expect(converter.convert("SSE"), "South South East");
      expect(converter.convert("S"), "South");
      expect(converter.convert("SSW"), "South South West");
      expect(converter.convert("SW"), "South West");
      expect(converter.convert("WSW"), "West South West");
      expect(converter.convert("W"), "West");
      expect(converter.convert("WNW"), "West North West");
      expect(converter.convert("NW"), "North West");
      expect(converter.convert("NNW"), "North North West");
    });
  });
}
