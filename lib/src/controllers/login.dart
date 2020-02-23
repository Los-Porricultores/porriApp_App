import 'dart:async';

import 'package:flutter/material.dart';

class LoginController {
  TextEditingController usernameController = TextEditingController(),
      passwordController = TextEditingController();

  StreamController<String> validationErrorStream = StreamController();

  void dispose() {
    validationErrorStream.close();
  }

  void sendLogin() {
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
      validationErrorStream.sink
          .add('Sabemos que tienes una contraseña, no te hagas de rogar...');
      return false;
    }

    validationErrorStream.sink.add(null);
    return true;
  }
}
