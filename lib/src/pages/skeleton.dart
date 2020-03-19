import 'package:flutter/material.dart';
import 'package:porri_app/src/widgets/bottomNavigationBarWidget.dart';
import 'package:porri_app/src/widgets/bumperCarsButtonWidget.dart';
import 'package:porri_app/src/widgets/rescueButton.dart';

class Skeleton extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      floatingActionButton: Wrap(
        direction: Axis.vertical,
        spacing: 10,
        children: <Widget>[
          BumperCarsButtonWidget(),
          RescueButton(),
        ],
      ),
      bottomNavigationBar: BottomNavigationBarWidget(),
    );
  }
}
