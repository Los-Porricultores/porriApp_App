import 'package:flutter/cupertino.dart';

class NavigationState {
  BuildContext generalContext;
  Widget currentWidget;

  void setGeneralContext({@required BuildContext buildContext}){
    this.generalContext = buildContext;
  }
}