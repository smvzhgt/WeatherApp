import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:forecastapp/core/pages/loading_page.dart';

void main() {
  testWidgets('LoadingPage test', (WidgetTester tester) async {
    await tester.pumpWidget(
      const MaterialApp(
        home: Scaffold(
          body: LoadingPage(),
        ),
      ),
    );

    // CircularProgressIndicator
    final indicatorFinder = find.byType(CircularProgressIndicator);
    expect(indicatorFinder, findsOneWidget);
  });
}
