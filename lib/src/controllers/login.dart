import 'dart:async';

import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:porri_app/src/controllers/main.dart';
import 'package:porri_app/src/controllers/serviceLocator.dart';
import 'package:porri_app/src/controllers/session.dart';
import 'package:porri_app/src/states/session.dart';

class LoginController {
  int errorContainerFlex = 1;
  TextEditingController usernameController = TextEditingController(),
      passwordController = TextEditingController();

  StreamController<String> validationErrorStream = StreamController();

  FirebaseAuth firebaseAuth;

  LoginController() {
    firebaseAuth = FirebaseAuth.instance;
  }

  void dispose() {
    validationErrorStream.close();
  }

  void sendLogin() async {
    mainController.showFullLoader();
    if (isLoginFormValid()) {
      firebaseAuth
          .signInWithEmailAndPassword(
        email: usernameController.text,
        password: passwordController.text,
      )
          .then(
        (AuthResult result) {
          FirebaseUser user = result.user;
          sl<SessionController>().saveSession(user);
        },
      ).catchError(
        (error) {
          validationErrorStream.sink.add(error.message);
          mainController.hideFullLoader();
        },
      );
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
