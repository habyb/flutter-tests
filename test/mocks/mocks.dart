import 'package:fluttertests/database/dao/contact_dao.dart';
import 'package:fluttertests/http/webclients/transaction_webclient.dart';
import 'package:mockito/mockito.dart';

class MockContactDao extends Mock implements ContactDao {}

class MockTransactionWebClient extends Mock implements TransactionWebClient {}