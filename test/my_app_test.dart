import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:recipe_app/my_app.dart';

void main() {
  testWidgets('MyApp builds and renders without errors', (WidgetTester tester) async {
    await tester.pumpWidget(const MyApp());
    await tester.pumpAndSettle();
    expect(find.byType(MyApp), findsOneWidget);
    expect(find.byType(WidgetsApp), findsOneWidget); // Used internally by GetMaterialApp.router
  });
}
