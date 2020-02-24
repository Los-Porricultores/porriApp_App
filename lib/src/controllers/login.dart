import 'dart:async';

import 'package:flutter/material.dart';
import 'package:porri_app/src/controllers/main.dart';

class LoginController {
  int errorContainerFlex = 1;
  TextEditingController usernameController = TextEditingController(),
      passwordController = TextEditingController();

  StreamController<String> validationErrorStream = StreamController();

  void dispose() {
    validationErrorStream.close();
  }

  void sendLogin() {
    mainController.showFullLoader();
    if (isLoginFormValid()) {
      print('login');
    }
  }

  bool isLoginFormValid() {
    // username validation
    String username = usernameController.text;
    if (username.isEmpty) {
      validationErrorStream.sink.add('¡Necesitamos tu usuario!');
      return false;
    }

    // password validation
    String password = passwordController.text;
    if (password.isEmpty) {
      validationErrorStream.sink.add('¡Necesitamos tu contraseña!');
      return false;
    }

    validationErrorStream.sink.add(null);
    return true;
  }

  void clearUsername() {
    usernameController.clear();
  }

  void clearPassword() {
    passwordController.clear();
  }
}
