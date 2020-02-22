import 'dart:async';

import 'package:path/path.dart';
import 'package:porri_app/src/controllers/serviceLocator.dart';
import 'package:porri_app/src/states/database.dart';
import 'package:sqflite/sqflite.dart';

class DatabaseController {
  Future<void> init() async {
    await openDatabase(
      join(await getDatabasesPath(), sl<DatabaseState>().databaseName),
      onCreate: (db, version) {
        sl<DatabaseState>().database = db;
      },
      version: 1,
    );
  }
}
