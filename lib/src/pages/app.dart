import 'package:flutter/material.dart';
import 'package:porri_app/resources/constants/appTheme.dart';

import 'package:porri_app/src/controllers/main.dart';
import 'package:porri_app/src/controllers/serviceLocator.dart';
import 'package:porri_app/src/models/session.dart';
import 'package:porri_app/src/pages/login.dart';
import 'package:porri_app/src/pages/skeleton.dart';
import 'package:porri_app/src/pages/splash.dart';
import 'package:porri_app/src/states/session.dart';
import 'package:porri_app/src/streams/streamsController.dart';
import 'package:porri_app/src/widgets/fullLoader.dart';

class App extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      theme: appTheme,
      home: SafeArea(
        child: _setUpCompleteStreamWidget(),
      ),
    );
  }

  Widget _setUpCompleteStreamWidget() {
    return StreamBuilder<bool>(
      stream: sl<StreamsController>().initCompleteStream.stream,
      initialData: false,
      builder: (BuildContext context, AsyncSnapshot<bool> snapshot) {
        if (snapshot.hasData && snapshot.data) {
          return _loaderStreamWidget();
        }

        return Splash();
      },
    );
  }

  Widget _loaderStreamWidget() {
    return StreamBuilder<bool>(
      stream: sl<StreamsController>().fullLoaderStream.stream,
      initialData: false,
      builder: (BuildContext context, AsyncSnapshot<bool> snapshot) {
        if (!snapshot.data) {
          return _sessionValidationStreamWidget();
        }

        return FullLoader();
      },
    );
  }

  Widget _sessionValidationStreamWidget() {
    return StreamBuilder<SessionModel>(
      stream: sl<StreamsController>().updatedSessionStream.stream,
      initialData: sl<SessionState>().sessionModel,
      builder: (BuildContext context, AsyncSnapshot<SessionModel> snapshot) {
        if (snapshot.hasData && snapshot.data != null) {
          mainController.hideFullLoader();
          return Skeleton();
        }

        return Login();
      },
    );
  }
}
