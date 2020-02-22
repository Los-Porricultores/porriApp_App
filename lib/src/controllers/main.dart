import 'dart:async';

import 'package:flutter/material.dart';
import 'package:porri_app/src/controllers/database.dart';
import 'package:porri_app/src/controllers/serviceLocator.dart';

class MainController {
  StreamController<bool> initCompleteStream = StreamController();

  void init() async {
    // binding
    WidgetsFlutterBinding.ensureInitialized();

    // service locator
    setUp();

    // database
    await sl<DatabaseController>().init();

    // complete
    initCompleteStream.sink.add(true);
  }

  void dispose() {
    initCompleteStream.close();
  }
}

MainController mainController = MainController();
