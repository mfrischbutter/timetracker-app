import 'package:flutter/material.dart';
import 'package:timetracker_app/models/user.dart';

enum ActivitiesStatus {
  Uninitialized,
  Loading,
  Done,
}

class ActivitiesProvider extends ChangeNotifier {
  ActivitiesStatus _status = ActivitiesStatus.Uninitialized;
  UserModel _user;

  ActivitiesStatus get status => _status;
  UserModel get user => _user;

  fetchActivitiesForUser(UserModel user) {
    _user = user;
  }
}
