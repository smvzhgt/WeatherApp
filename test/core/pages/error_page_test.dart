import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:forecastapp/core/pages/error_page.dart';

void main() {
  testWidgets('ErrorPage', (WidgetTester tester) async {
    const errorMessage = 'Error';
    await tester.pumpWidget(
      const MaterialApp(
        home: Scaffold(
          body: ErrorPage(message: errorMessage),
        ),
      ),
    );

    // Text
    final textFinder = find.byType(Text);
    Text text = tester.widget(textFinder);
    expect(textFinder, findsOneWidget);
    expect(text.data, 'Error');
    expect(text.style!.fontSize, 30.0);
    expect(text.style!.fontWeight, FontWeight.bold);
  });
}
