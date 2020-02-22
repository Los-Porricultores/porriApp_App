import 'package:flutter/material.dart';
import 'package:porri_app/src/widgets/circularLoader.dart';

class Splash extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
          alignment: Alignment.center,
          color: Colors.black,
          child: CircularLoader()),
    );
  }
}
