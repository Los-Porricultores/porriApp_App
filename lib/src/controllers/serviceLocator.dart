import 'package:get_it/get_it.dart';
import 'package:porri_app/src/controllers/database.dart';
import 'package:porri_app/src/states/database.dart';

GetIt sl = GetIt.asNewInstance();

Future<void> setUp() async {
  // States
  sl.registerSingleton<DatabaseState>(DatabaseState(), signalsReady: true);

  // controllers
  sl.registerSingleton<DatabaseController>(DatabaseController(),
      signalsReady: true);
}
