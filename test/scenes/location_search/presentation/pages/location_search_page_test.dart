import 'package:flutter/material.dart';
import 'package:flutter_localizations/flutter_localizations.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:forecastapp/generated/l10n.dart';
import 'package:forecastapp/scenes/location_search/presentation/pages/location_search_page.dart';

void main() {
  testWidgets('LocationSearchPage', (WidgetTester tester) async {
    await tester.pumpWidget(
      MaterialApp(
        localizationsDelegates: const [
          GlobalMaterialLocalizations.delegate,
          GlobalWidgetsLocalizations.delegate,
          S.delegate
        ],
        supportedLocales: S.delegate.supportedLocales,
        home: const Scaffold(
          body: ProviderScope(
            child: LocationSearchPage(),
          ),
        ),
      ),
    );

    // TODO: - change test cases
    // final textFieldFinder = find.byType(TextField);
    // TextField textField = tester.widget(textFieldFinder);

    // expect(textFieldFinder, findsOneWidget);
    // expect(textField.controller!.text, '');

    // await tester.tap(textFieldFinder);
    // await tester.enterText(textFieldFinder, 'san');
    //
    // await tester.pump();
    // expect(textField.controller!.text, equals('san'));
    // expect(find.text('san'), findsOneWidget);
  });
}
