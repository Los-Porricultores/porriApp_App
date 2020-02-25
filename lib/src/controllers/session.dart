import 'dart:async';

import 'package:firebase_auth/firebase_auth.dart';
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
          ' userId TEXT NOT NULL)',
        );
  }

  Future<bool> searchAnySessionActive() async {
    List<Map<String, dynamic>> sessions =
        await sl<DatabaseState>().database.query(
              sessionsTableName,
              where: 'isActive = 1',
              orderBy: 'lastLoginDateTime DESC',
            );

    if (sessions.isNotEmpty) {
      sl<SessionState>().setSession(
        session: SessionModel(
          id: sessions.first['id'],
          userId: sessions.first['userId'],
          isActive: true,
          lastLoginDateTime: DateTime.fromMillisecondsSinceEpoch(
              sessions.first['lastLoginDateTime']),
          lastLogoutDateTime: DateTime.fromMillisecondsSinceEpoch(
              sessions.first['lastLogoutDateTime']),
        ),
      );

      return true;
    }

    return false;
  }

  void saveSession(FirebaseUser user) async {
    int time = DateTime.now().millisecondsSinceEpoch;
    int success = await sl<DatabaseState>().database.insert(sessionsTableName, {
      'userId': user.uid,
      'isActive': 1,
      'lastLoginDateTime': time,
      'lastLogoutDateTime': 0,
    });

    if (success > 0) {
      sl<SessionState>().setSession(
        session: SessionModel(
          id: null,
          userId: user.uid.toString(),
          isActive: true,
          lastLoginDateTime: DateTime.fromMillisecondsSinceEpoch(time),
          lastLogoutDateTime: DateTime.fromMillisecondsSinceEpoch(time),
        ),
      );
    }
  }
}
