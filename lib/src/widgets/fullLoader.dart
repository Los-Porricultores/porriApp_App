import 'package:flutter/material.dart';
import 'package:porri_app/src/widgets/circularLoader.dart';

class FullLoader extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.black.withOpacity(0.5),
      body: Center(
        child: CircularLoader(),
      ),
    );
  }
}
