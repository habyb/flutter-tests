import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:fluttertests/database/dao/contact_dao.dart';
import 'package:fluttertests/main.dart';
import 'package:fluttertests/screens/dashboard.dart';

import '../matchers/matchers.dart';
import '../mocks/mocks.dart';

void main() {
  testWidgets('should display the main image when the dashboard is opened',
      (WidgetTester tester) async {
    final mockTransactionWebClient = MockTransactionWebClient();

    await tester.pumpWidget(MaterialApp(
        home: FlutterTests(
      transactionWebClient: mockTransactionWebClient,
      contactDao: ContactDao(),
    )));
    final mainImage = find.byType(Image);
    expect(mainImage, findsOneWidget);
  });
  testWidgets(
      'should display the transfer feature when the dashboard is opened',
      (tester) async {
    await tester.pumpWidget(MaterialApp(home: Dashboard()));
    final transferFeatureItem = find.byWidgetPredicate((widget) =>
        featureItemMatcher(widget, 'Transfer', Icons.monetization_on));
    expect(transferFeatureItem, findsOneWidget);
  });
  testWidgets(
      'should display the transaction feed feature when the dashboard is opened',
      (tester) async {
    await tester.pumpWidget(MaterialApp(home: Dashboard()));
    final transactionFeedFeatureItem = find.byWidgetPredicate((widget) =>
        featureItemMatcher(widget, 'Transaction Feed', Icons.description));
    expect(transactionFeedFeatureItem, findsOneWidget);
  });
}
