import 'package:flutter/material.dart';

class UserModel {
  int id;
  String username, firstName, secondName, password;

  UserModel({
    @required this.id,
    this.username,
    this.firstName,
    this.secondName,
    this.password,
  });
}
