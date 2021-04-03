import 'package:fluttertests/http/webclients/transaction_webclient.dart';
import 'package:fluttertests/widgets/app_dependencies.dart';

import 'database/dao/contact_dao.dart';
import 'screens/dashboard.dart';
import 'package:flutter/material.dart';

void main() {
  runApp(FlutterTests(
    contactDao: ContactDao(),
    transactionWebClient: TransactionWebClient(),
  ));
}

class FlutterTests extends StatelessWidget {
  final ContactDao contactDao;
  final TransactionWebClient transactionWebClient;

  FlutterTests({
    @required this.contactDao,
    @required this.transactionWebClient,
  });
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return AppDependencies(
      contactDao: contactDao,
      transactionWebClient: transactionWebClient,
      child: MaterialApp(
        theme: ThemeData(
          primaryColor: Colors.green[900],
          accentColor: Colors.blueAccent[700],
          buttonTheme: ButtonThemeData(
            buttonColor: Colors.blueAccent[700],
            textTheme: ButtonTextTheme.primary,
          ),
        ),
        home: Dashboard(),
      ),
    );
  }
}
