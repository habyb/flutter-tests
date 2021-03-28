import 'package:flutter/widgets.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:fluttertests/main.dart';
import 'package:fluttertests/models/contact.dart';
import 'package:fluttertests/screens/contacts_list.dart';
import 'package:fluttertests/screens/dashboard.dart';
import 'package:fluttertests/screens/transaction_form.dart';
import 'package:mockito/mockito.dart';

import '../mocks/mocks.dart';
import 'actions.dart';

void main() {
  testWidgets('should transfer to a contact', (tester) async {
    final mockContactDao = MockContactDao();
    await tester.pumpWidget(FlutterTests(
      contactDao: mockContactDao,
    ));
    final dashboard = find.byType(Dashboard);
    expect(dashboard, findsOneWidget);

    when(mockContactDao.findAll()).thenAnswer((invocation) async {
      // debugPrint('name invovcation ${invocation.memberName}');
      return [Contact(0, 'Sam', 123)];
    });
    await clickOnTheTransferFeatureItem(tester);
    await tester.pumpAndSettle();

    final contactsList = find.byType(ContactsList);
    expect(contactsList, findsOneWidget);

    final contactItem = find.byWidgetPredicate((widget) {
      if (widget is ContactItem) {
        return widget.contact.name == 'Sam' &&
            widget.contact.accountNumber == 123;
      }
      return false;
    });
    // expect(contactItem, findsOneWidget);
    // await tester.tap(contactItem);
    // await tester.pumpAndSettle();

    // final transactionForm = find.byType(TransactionForm);
    // expect(transactionForm, findsOneWidget);
  });
}
