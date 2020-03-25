import 'dart:async';

import 'package:flutter/material.dart';
import 'package:porri_app/src/models/session.dart';

class StreamsController {
  StreamController<bool> initCompleteStream = StreamController.broadcast(),
      fullLoaderStream = StreamController.broadcast();

  StreamController<String> registerValidationErrorStream =
      StreamController.broadcast();

  StreamController<SessionModel> updatedSessionStream =
      StreamController.broadcast();

  StreamController<Widget> openPageStream = StreamController.broadcast();

  void dispose() {
    initCompleteStream.close();
    fullLoaderStream.close();
    registerValidationErrorStream.close();
    updatedSessionStream.close();
    openPageStream.close();
  }
}
