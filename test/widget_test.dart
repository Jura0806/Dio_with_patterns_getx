// This is a basic Flutter widget test.
//
// To perform an interaction with a widget in your test, use the WidgetTester
// utility that Flutter provides. For example, you can send tap and scroll
// gestures. You can also use WidgetTester to find child widgets in the widget
// tree, read text, and verify that the values of widget properties are correct.

import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
//import 'package:get/get_state_manager/src/rx_flutter/rx_obx_widget.dart';

import 'package:patterns_getx/main.dart';
import 'package:patterns_getx/pages/post_detail_page.dart';

void main() {
  testWidgets('Counter increments smoke test', (WidgetTester tester) async {
    // Build our app and trigger a frame.
    await tester.pumpWidget(DetailPage());

   expect(find.byType(String), findsOneWidget);
   // expect(find.byType(GridView), findsNothing);
  expect(find.text("OneInfo"), findsOneWidget);
    //expect(find.text("GetX"), findsNWidgets(1));

    // await tester.tap(find.byIcon(Icons.add));
    // await tester.pump();
  });
}
