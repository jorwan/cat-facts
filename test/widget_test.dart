import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';

import 'package:cat_facts/main.dart';

void main() {
  testWidgets('Cat Fact Getter Button Is Available',
      (WidgetTester tester) async {
    /**
     * Arrange 
     */
    // Build our app and trigger a frame
    await tester.pumpWidget(CatFactApp());
    final catFactGetterButtonFinder = find.ancestor(
        of: find.text('Hello World'), matching: find.byType(RaisedButton));

    /**
     * Act
     */

    /**
     * Assert
     */
    // Expect to find a text with Hello World
    // test('Showing button', () {
    expect(catFactGetterButtonFinder, findsOneWidget);

    final buttonColor =
        (catFactGetterButtonFinder.evaluate().single.widget as RaisedButton)
            .color;
    expect(buttonColor, Colors.red);
  });
}
