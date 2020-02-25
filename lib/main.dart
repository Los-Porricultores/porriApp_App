import 'package:flutter/material.dart';

import 'package:porri_app/src/controllers/main.dart';
import 'package:porri_app/src/pages/app.dart';

void main() {
  // main controller
  mainController.init();

  // run app
  runApp(App());
}
