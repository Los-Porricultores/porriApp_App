import 'dart:async';

import 'package:flutter/material.dart';
import 'package:path/path.dart';
import 'package:porri_app/src/controllers/serviceLocator.dart';
import 'package:porri_app/src/controllers/session.dart';
import 'package:porri_app/src/states/database.dart';
import 'package:sqflite/sqflite.dart';

class DatabaseController {
  Future<void> setUp() async {
    await openDatabase(
      join(await getDatabasesPath(), sl<DatabaseState>().databaseName),
      onCreate: (Database db, int version) {
        this
          ..saveDatabase(database: db)
          ..createTables();
      },
      onOpen: (Database db) {
        saveDatabase(database: db);
      },
      version: 1,
    );
  }

  void saveDatabase({@required Database database}) {
    sl<DatabaseState>().database = database;
  }

  void createTables() async {
    await sl<SessionController>().createTable();
  }
}
