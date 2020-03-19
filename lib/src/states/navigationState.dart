import 'package:flutter/cupertino.dart';

class NavigationState {
  BuildContext generalContext;

  void setGeneralContext({@required BuildContext buildContext}){
    this.generalContext = buildContext;
  }
}