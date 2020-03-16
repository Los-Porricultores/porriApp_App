import 'package:flutter/material.dart';

class CommonModal extends StatelessWidget {
  final String modalTitle,
      modalMessage,
      modalNegativeButton,
      modalPositiveButton;

  CommonModal(
    this.modalTitle,
    this.modalMessage,
    this.modalNegativeButton,
    this.modalPositiveButton,
  );

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.only(
          topLeft: Radius.circular(35),
          topRight: Radius.circular(35),
        ),
      ),
      child: Wrap(
        children: <Widget>[
          ListTile(
            title: new Text(
              modalTitle,
              softWrap: true,
              textAlign: TextAlign.center,
              style:
                  TextStyle(color: Colors.black, fontWeight: FontWeight.bold),
            ),
          ),
          ListTile(
            title: new Text(
              modalMessage,
              softWrap: true,
              textAlign: TextAlign.center,
              style: TextStyle(color: Colors.grey),
            ),
          ),
          Padding(
            padding: EdgeInsets.symmetric(vertical: 20, horizontal: 10),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceAround,
              children: <Widget>[
                Chip(
                  padding: EdgeInsets.symmetric(horizontal: 10),
                  backgroundColor: Colors.redAccent,
                  label: Text(modalNegativeButton),
                ),
                Chip(
                  padding: EdgeInsets.symmetric(horizontal: 10),
                  backgroundColor: Colors.lightGreen,
                  label: Text(modalPositiveButton),
                )
              ],
            ),
          ),
        ],
      ),
    );
  }
}
