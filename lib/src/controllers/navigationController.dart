import 'package:flutter/material.dart';
import 'package:porri_app/src/controllers/serviceLocator.dart';
import 'package:porri_app/src/states/navigationState.dart';

class NavigationController {
  Future<dynamic> push({@required Widget widget}) async {
    await Navigator.push(
      sl<NavigationState>().generalContext,
      MaterialPageRoute(
        builder: (BuildContext buildContext) {
          return widget;
        },
      ),
    );
  }

  void pop() {
    Navigator.pop(sl<NavigationState>().generalContext);
  }

  void setGeneralContext({@required BuildContext buildContext}) {
    sl<NavigationState>().setGeneralContext(buildContext: buildContext);
  }
}
