import 'package:flutter/cupertino.dart';

class SessionModel {
  int id, userId;
  bool isActive;
  DateTime lastLoginDateTime, lastLogoutDateTime;

  SessionModel({
    @required this.id,
    @required this.userId,
    this.isActive,
    this.lastLoginDateTime,
    this.lastLogoutDateTime,
  });
}
