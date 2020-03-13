import 'package:get_it/get_it.dart';
import 'package:porri_app/src/controllers/database.dart';
import 'package:porri_app/src/controllers/loginController.dart';
import 'package:porri_app/src/controllers/session.dart';
import 'package:porri_app/src/states/database.dart';
import 'package:porri_app/src/states/session.dart';
import 'package:porri_app/src/streams/streamsController.dart';

GetIt sl = GetIt.asNewInstance();

Future<void> setUp() async {
  // States
  sl.registerSingleton<DatabaseState>(DatabaseState(), signalsReady: true);
  sl.registerSingleton<SessionState>(SessionState(), signalsReady: true);

  // controllers
  sl.registerSingleton<DatabaseController>(DatabaseController(),
      signalsReady: true);
  sl.registerSingleton<StreamsController>(StreamsController(),
      signalsReady: true);
  sl.registerSingleton<SessionController>(SessionController(),
      signalsReady: true);
  sl.registerSingleton<LoginController>(LoginController(), signalsReady: true);
}
