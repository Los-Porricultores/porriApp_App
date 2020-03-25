import 'package:get_it/get_it.dart';
import 'package:porri_app/src/controllers/database.dart';
import 'package:porri_app/src/controllers/loginController.dart';
import 'package:porri_app/src/controllers/mapController.dart';
import 'package:porri_app/src/controllers/navigationController.dart';
import 'package:porri_app/src/controllers/session.dart';
import 'package:porri_app/src/states/database.dart';
import 'package:porri_app/src/states/mapState.dart';
import 'package:porri_app/src/states/navigationState.dart';
import 'package:porri_app/src/states/session.dart';
import 'package:porri_app/src/streams/streamsController.dart';

GetIt sl = GetIt.asNewInstance();

Future<void> setUp() async {
  // States
  sl.registerSingleton<DatabaseState>(DatabaseState(), signalsReady: true);
  sl.registerSingleton<SessionState>(SessionState(), signalsReady: true);
  sl.registerSingleton<NavigationState>(NavigationState(), signalsReady: true);
  sl.registerSingleton<MapState>(MapState(), signalsReady: true);

  // controllers
  sl.registerSingleton<DatabaseController>(DatabaseController(),
      signalsReady: true);
  sl.registerSingleton<StreamsController>(StreamsController(),
      signalsReady: true);
  sl.registerSingleton<SessionController>(SessionController(),
      signalsReady: true);
  sl.registerSingleton<LoginController>(LoginController(), signalsReady: true);
  sl.registerSingleton<NavigationController>(NavigationController(),
      signalsReady: true);
  sl.registerSingleton<MapController>(MapController(), signalsReady: true);
}
