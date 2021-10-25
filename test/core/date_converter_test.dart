import 'package:flutter_test/flutter_test.dart';
import 'package:forecastapp/core/date_converter.dart';

void main() {
  group('DateFormatter', () {
    test('should return right formatted date when full date', () async {
      const fullDate = "2021-08-24T14:33:07.964603Z";
      const tExpectedDate = "Tuesday 24 August";
      final tFormattedDate = DateFormatter.format(fullDate);
      expect(tFormattedDate, tExpectedDate);
    });
  });
}
