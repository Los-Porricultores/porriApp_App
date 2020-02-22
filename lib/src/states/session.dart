import 'dart:async';

import 'package:flutter/cupertino.dart';
import 'package:porri_app/src/models/session.dart';

class SessionState {
  SessionModel sessionModel;
  StreamController<SessionModel> updatedSessionStream =
      StreamController.broadcast();

  void dispose() {
    updatedSessionStream.close();
  }

  void setSession({@required SessionModel session}) {
    sessionModel = session;
    updatedSessionStream.sink.add(sessionModel);
  }
}
