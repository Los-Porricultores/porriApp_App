import 'dart:async';

import 'package:flutter/material.dart';
import 'package:porri_app/src/controllers/database.dart';
import 'package:porri_app/src/controllers/serviceLocator.dart';
import 'package:porri_app/src/controllers/session.dart';

class MainController {
  StreamController<bool> initCompleteStream = StreamController(),
      fullLoaderStream = StreamController();

  void init() async {
    // binding
    WidgetsFlutterBinding.ensureInitialized();

    // service locator
    setUp();

    // database
    await sl<DatabaseController>().setUp();
    await sl<SessionController>().searchAnySessionActive();

    // complete
    initCompleteStream.sink.add(true);
  }

  void dispose() {
    initCompleteStream.close();
    fullLoaderStream.close();
  }

  void showFullLoader() {
    fullLoaderStream.sink.add(true);
  }

  void hideFullLoader() {
    fullLoaderStream.sink.add(false);
  }
}

MainController mainController = MainController();
