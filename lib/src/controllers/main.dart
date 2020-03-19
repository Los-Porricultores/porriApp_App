
import 'package:flutter/material.dart';
import 'package:porri_app/src/controllers/database.dart';
import 'package:porri_app/src/controllers/serviceLocator.dart';
import 'package:porri_app/src/controllers/session.dart';
import 'package:porri_app/src/streams/streamsController.dart';

class MainController {
  void init() async {
    // binding
    WidgetsFlutterBinding.ensureInitialized();

    // service locator
    setUp();

    // database
    await sl<DatabaseController>().setUp();
    await sl<SessionController>().searchAnySessionActive();

    // complete
    sl<StreamsController>().initCompleteStream.sink.add(true);
  }

  void showFullLoader() {
    sl<StreamsController>().fullLoaderStream.sink.add(true);
  }

  void hideFullLoader() {
    sl<StreamsController>().fullLoaderStream.sink.add(false);
  }
}

MainController mainController = MainController();
