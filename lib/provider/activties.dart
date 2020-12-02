import 'package:flutter/material.dart';
import 'package:timetracker_app/api/api_reponse.dart';
import 'package:timetracker_app/api/service.dart';

enum ActivitiesStatus {
  Uninitialized,
  Loading,
  Done,
}

class ActivitiesProvider extends ChangeNotifier {
  ActivitiesStatus _status = ActivitiesStatus.Uninitialized;

  ActivitiesStatus get status => _status;

  fetchActivitiesForUser() async {
    ApiResponse _response = await ApiService().fetchActivities();
    
  }
}
