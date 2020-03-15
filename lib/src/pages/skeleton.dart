import 'package:flutter/material.dart';
import 'package:porri_app/src/widgets/rescueButton.dart';

class Skeleton extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      floatingActionButton: RescueButton(),
    );
  }
}
