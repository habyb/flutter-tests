import 'package:fluttertests/database/dao/contact_dao.dart';

import 'screens/dashboard.dart';
import 'package:flutter/material.dart';

void main() {
  runApp(FlutterTests(contactDao: ContactDao(),));
}

class FlutterTests extends StatelessWidget {
  final ContactDao contactDao;

  FlutterTests({@required this.contactDao});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      theme: ThemeData(
        primaryColor: Colors.green[900],
        accentColor: Colors.blueAccent[700],
        buttonTheme: ButtonThemeData(
          buttonColor: Colors.blueAccent[700],
          textTheme: ButtonTextTheme.primary,
        ),
      ),
      home: Dashboard(contactDao: contactDao),
    );
  }
}
