import 'dart:async';

import 'package:flutter/cupertino.dart';
import 'package:porri_app/src/controllers/serviceLocator.dart';
import 'package:porri_app/src/models/session.dart';
import 'package:porri_app/src/streams/streamsController.dart';

class SessionState {
  SessionModel sessionModel;

  void setSession({@required SessionModel session}) {
    sessionModel = session;
    sl<StreamsController>().updatedSessionStream.sink.add(sessionModel);
  }
}
