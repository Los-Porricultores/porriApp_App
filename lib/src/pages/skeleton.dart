import 'package:flutter/material.dart';
import 'package:porri_app/src/controllers/serviceLocator.dart';
import 'package:porri_app/src/pages/map.dart';
import 'package:porri_app/src/streams/streamsController.dart';
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
      body: StreamBuilder<Widget>(
        stream: sl<StreamsController>().openPageStream.stream,
        initialData: Map(),
        builder:
            (BuildContext buildContext, AsyncSnapshot<Widget> asyncSnapshot) {
          return asyncSnapshot.data;
        },
      ),
    );
  }
}
