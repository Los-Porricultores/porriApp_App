import 'package:porri_app/resources/constants/database.dart';
import 'package:sqflite/sqflite.dart';

class DatabaseState {
  String databaseName;
  Database database;

  DatabaseState() {
    databaseName = databaseNameConst;
  }
}
