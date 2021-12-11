import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:forecastapp/scenes/location_search/domain/entities/location_search_entity.dart';
import 'package:forecastapp/scenes/location_search/presentation/widgets/location_search_row_item.dart';

void main() {
  testWidgets('LocationSearchRowItem', (WidgetTester tester) async {
    final entity = LocationSearch(
      title: 'Test',
      locationType: 'City',
      woeid: 0,
      isFavorite: false,
    );
    void onClickButton(LocationSearch entity) {}
    await tester.pumpWidget(
      MaterialApp(
        home: Scaffold(
            body: LocationSearchRowItem(
                entity: entity, onClickButton: onClickButton)),
      ),
    );

    // Card
    final cardFinder = find.byType(Card);
    expect(cardFinder, findsOneWidget);

    // ListTile
    final listTileFinder = find.byType(ListTile);
    expect(listTileFinder, findsOneWidget);

    // Text
    final textFinder = find.byType(Text);
    Text text = tester.widget(textFinder);
    expect(textFinder, findsOneWidget);
    expect(text.data, 'Test');

    // Icon
    final iconFinder = find.byType(Icon);
    Icon icon = tester.widget(iconFinder);
    expect(iconFinder, findsOneWidget);
    expect(icon.toString(), const Icon(Icons.star_border).toString());
  });
}
