import 'package:porri_app/resources/constants/database.dart';
import 'package:porri_app/src/controllers/serviceLocator.dart';
import 'package:porri_app/src/states/database.dart';

class UserController {
  Future<void> createTable() async {
    await sl<DatabaseState>().database.execute(
          'CREATE TABLE $usersTableName('
          'id INTEGER PRIMARY KEY AUTOINCREMENT,'
          ' username TEXT NOT NULL,'
          ' firstName TEXT NOT NULL,'
          ' secondName TEXT NOT NULL,'
          ' password TEXT NOT NULL,'
          ' sessionId INTEGER NOT NULL,'
          ' CONSTRAINT fk_sessions FOREIGN KEY (sessionId) REFERENCES sessions(id)'
          ')',
        );
  }
}
