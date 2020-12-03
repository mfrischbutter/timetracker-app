import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:timetracker_app/api/api_reponse.dart';
import 'package:timetracker_app/api/service.dart';
import 'package:timetracker_app/models/activity.dart';
import 'package:timetracker_app/utils/extensions.dart';

enum ActivitiesStatus {
  Uninitialized,
  Loading,
  Done,
}

class ActivitiesProvider extends ChangeNotifier {
  ActivitiesStatus _status = ActivitiesStatus.Uninitialized;
  Map _activitiesGrouped;

  ActivitiesStatus get status => _status;
  Map get activitiesGrouped => _activitiesGrouped;

  fetchActivitiesForUser() async {
    ApiResponse _response = await ApiService().fetchActivities();
    List<Activity> _activities =
        activitiesListFromResponse(jsonDecode(_response.data));
    _activitiesGrouped = _activities.groupBy((a) => a.date);
    _status = ActivitiesStatus.Done;
    notifyListeners();
  }
}
