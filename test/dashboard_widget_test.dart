import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:fluttertests/main.dart';
import 'package:fluttertests/screens/dashboard.dart';

void main() {
  testWidgets('should display the main image when the dashboard is opened',
      (WidgetTester tester) async {
    await tester.pumpWidget(MaterialApp(home: FlutterTests()));
    final mainImage = find.byType(Image);
    expect(mainImage, findsOneWidget);
  });
  testWidgets('should display the first feature when the dashboard is opened', (tester) async {
    await tester.pumpWidget(MaterialApp(home: Dashboard()));
    final firstFeature = find.byType(FeatureItem);
    expect(firstFeature, findsWidgets);
  });
}
