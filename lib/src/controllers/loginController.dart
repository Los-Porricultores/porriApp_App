
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:porri_app/src/controllers/main.dart';
import 'package:porri_app/src/controllers/serviceLocator.dart';
import 'package:porri_app/src/controllers/session.dart';
import 'package:porri_app/src/streams/streamsController.dart';

class LoginController {
  int errorContainerFlex = 1;
  TextEditingController usernameController = TextEditingController(),
      passwordController = TextEditingController();

  FirebaseAuth firebaseAuth;

  LoginController() {
    firebaseAuth = FirebaseAuth.instance;
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
          mainController.hideFullLoader();
        },
      ).catchError(
        (error) {
          sl<StreamsController>()
              .registerValidationErrorStream
              .sink
              .add(error.message);
          mainController.hideFullLoader();
        },
      );
    }else{
      mainController.hideFullLoader();
    }
  }

  bool isLoginFormValid() {
    // username validation
    String username = usernameController.text;
    if (username.isEmpty) {
      sl<StreamsController>()
          .registerValidationErrorStream
          .sink
          .add('¡Necesitamos tu usuario!');
      return false;
    }

    // password validation
    String password = passwordController.text;
    if (password.isEmpty) {
      sl<StreamsController>()
          .registerValidationErrorStream
          .sink
          .add('¡Necesitamos tu contraseña!');
      return false;
    }

    sl<StreamsController>().registerValidationErrorStream.sink.add(null);
    return true;
  }

  void clearUsername() {
    usernameController.clear();
  }

  void clearPassword() {
    passwordController.clear();
  }
}
