import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:forecastapp/core/pages/empty_page.dart';

void main() {
  testWidgets('EmptyPage test', (WidgetTester tester) async {
    await tester.pumpWidget(
      const MaterialApp(
        home: Scaffold(
          body: EmptyPage(),
        ),
      ),
    );

    // SizeBox
    final sizeBoxFinder = find.byType(SizedBox);
    expect(sizeBoxFinder, findsOneWidget);
  });
}
