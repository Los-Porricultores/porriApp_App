import 'dart:async';

import 'package:porri_app/resources/constants/database.dart';
import 'package:porri_app/src/controllers/serviceLocator.dart';
import 'package:porri_app/src/models/session.dart';
import 'package:porri_app/src/states/database.dart';
import 'package:porri_app/src/states/session.dart';

class SessionController {
  Future<void> createTable() async {
    await sl<DatabaseState>().database.execute(
          'CREATE TABLE $sessionsTableName('
          'id INTEGER PRIMARY KEY AUTOINCREMENT,'
          ' isActive INTEGER NOT NULL,'
          ' lastLoginDateTime INTEGER,'
          ' lastLogoutDateTime INTEGER,'
          ' userId INTEGER NOT NULL)',
        );
  }

  Future<bool> searchAnySessionActive() async {
    List<Map<String, dynamic>> sessions =
        await sl<DatabaseState>().database.query(
              'sessions',
              where: 'isActive = 1',
              orderBy: 'lastLoginDateTime DESC',
            );

    if (sessions.isNotEmpty) {
      sl<SessionState>().setSession(
        session: SessionModel(
          id: sessions.first['id'],
          userId: sessions.first['userId'],
          isActive: sessions.first['isActive'],
          lastLoginDateTime: sessions.first['lastLoginDateTime'],
          lastLogoutDateTime: sessions.first['lastLogoutDateTime'],
        ),
      );

      return true;
    }

    return false;
  }
}
