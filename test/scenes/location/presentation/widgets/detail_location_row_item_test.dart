import 'package:flutter/material.dart';
import 'package:flutter_localizations/flutter_localizations.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:forecastapp/generated/l10n.dart';
import 'package:forecastapp/scenes/location/presentation/widgets/detail_location_row_item.dart';

void main() {
  testWidgets('DetailLocationRowItem', (WidgetTester tester) async {
    const detailLocationRowItem = DetailLocationRowItem(
      containerHeight: 200,
      imageHeight: 50,
      imageWidth: 50,
      imageName: "assets/icons/pressure.svg",
      text: "750 mb",
    );

    await tester.pumpWidget(
      MaterialApp(
        localizationsDelegates: const [
          GlobalMaterialLocalizations.delegate,
          GlobalWidgetsLocalizations.delegate,
          S.delegate
        ],
        supportedLocales: S.delegate.supportedLocales,
        home: const Scaffold(
          body: detailLocationRowItem,
        ),
      ),
    );

    // TODO: - change test cases
    // Container
    // final containerFinder = find.byType(Container);
    // expect(containerFinder, findsOneWidget);

    // Container container = tester.widget(containerFinder);
    // expect(container.margin, const EdgeInsets.only(left: 8, right: 8));
    // expect(container.padding, const EdgeInsets.only(left: 8.0));
    // final boxDecoration = (container.decoration) as BoxDecoration;
    // expect(boxDecoration.color, Colors.grey.shade300);
    // expect(boxDecoration.border, Border.all(color: Colors.grey.shade200));
    // expect(boxDecoration.borderRadius, BorderRadius.circular(20.0));

    // Row
    // final rowFinder = find.byType(Row);
    // expect(rowFinder, findsOneWidget);

    // SvgPicture
    // final pictureFinder = find.byType(SvgPicture);
    // expect(pictureFinder, findsOneWidget);

    // SizedBox
    // final sizedBoxFinder = find.byType(SizedBox);
    // expect(sizedBoxFinder.first, findsOneWidget);

    // Text
    // final textFinder = find.byType(Text);
    // Text text = tester.widget(textFinder);
    // expect(textFinder, findsOneWidget);
    // expect(text.data, "750 mb");
  });
}
