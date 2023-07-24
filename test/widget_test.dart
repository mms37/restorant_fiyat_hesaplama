// This is a basic Flutter widget test.
//
// To perform an interaction with a widget in your test, use the WidgetTester
// utility in the flutter_test package. For example, you can send tap and scroll
// gestures. You can also use WidgetTester to find child widgets in the widget
// tree, read text, and verify that the values of widget properties are correct.

import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';

import 'package:restorant/main.dart';
import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';


void main() {
  testWidgets('Select items and calculate total price', (WidgetTester tester) async {
    await tester.pumpWidget(RestaurantApp());

    // Verify the initial total price is zero.
    expect(find.text('Toplam Fiyat: 0.00 TL'), findsOneWidget);

    // Tap on the first menu item to select it.
    await tester.tap(find.byType(Checkbox).first);
    await tester.pump();

    // Verify if the total price is updated accordingly.
    expect(find.text('Toplam Fiyat: 45.00 TL'), findsOneWidget);

    // Tap on another menu item to select it.
    await tester.tap(find.byType(Checkbox).at(3));
    await tester.pump();

    // Verify if the total price is updated again.
    expect(find.text('Toplam Fiyat: 95.00 TL'), findsOneWidget);

    // Tap on the first menu item to deselect it.
    await tester.tap(find.byType(Checkbox).first);
    await tester.pump();

    // Verify if the total price is updated accordingly after deselection.
    expect(find.text('Toplam Fiyat: 50.00 TL'), findsOneWidget);
  });
}
