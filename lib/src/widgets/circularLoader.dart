import 'package:flutter/material.dart';

class CircularLoader extends StatelessWidget {
  final double height, width;

  CircularLoader({this.height: 50, this.width: 50});

  @override
  Widget build(BuildContext context) {
    return Container(
      height: height,
      width: width,
      child: CircularProgressIndicator(
        strokeWidth: 1,
      ),
    );
  }
}
