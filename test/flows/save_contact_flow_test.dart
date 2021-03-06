import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:fluttertests/main.dart';
import 'package:fluttertests/screens/contact_form.dart';
import 'package:fluttertests/screens/contacts_list.dart';
import 'package:fluttertests/screens/dashboard.dart';

import '../matchers/matchers.dart';
import '../mocks/mocks.dart';
import 'actions.dart';

void main() {
  testWidgets('should save a contact', (tester) async {
    final mockContactDao = MockContactDao();
    final mockTransactionWebClient = MockTransactionWebClient();

    await tester.pumpWidget(FlutterTests(
      transactionWebClient: mockTransactionWebClient,
      contactDao: mockContactDao,
    ));

    final dashboard = find.byType(Dashboard);
    expect(dashboard, findsOneWidget);

    await clickOnTheTransferFeatureItem(tester);
    await tester.pumpAndSettle();

    final contactsList = find.byType(ContactsList);
    expect(contactsList, findsOneWidget);

    // verify(mockContactDao.findAll()).called(0);

    final fabNewContact = find.widgetWithIcon(FloatingActionButton, Icons.add);
    expect(fabNewContact, findsOneWidget);
    await tester.tap(fabNewContact);
    await tester.pumpAndSettle();

    final contactForm = find.byType(ContactForm);
    expect(contactForm, findsOneWidget);

    final nameTextField = find
        .byWidgetPredicate((widget) => textFieldByLabelTextMatcher(widget, 'Full name'));
    expect(nameTextField, findsOneWidget);
    await tester.enterText(nameTextField, 'Alex');

    final accountNumberTextField = find.byWidgetPredicate(
        (widget) => textFieldByLabelTextMatcher(widget, 'Account number'));
    expect(accountNumberTextField, findsOneWidget);
    await tester.enterText(accountNumberTextField, '1000');

    final createButton = find.widgetWithText(ElevatedButton, 'Create');
    expect(createButton, findsOneWidget);
    await tester.tap(createButton);
    await tester.pumpAndSettle();

    // verify(mockContactDao.save(Contact(0, 'Alex', 1000)));

    // verify(mockContactDao.findAll());
  });
}
