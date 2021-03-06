import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:timetracker_app/api/api_reponse.dart';
import 'package:timetracker_app/api/service.dart';
import 'package:timetracker_app/models/project_activity.dart';

enum ProjectActivitiesStatus {
  Uninitialized,
  Loading,
  Done,
}

class ProjectActivitiesProvider extends ChangeNotifier {
  ProjectActivitiesStatus _status = ProjectActivitiesStatus.Uninitialized;
  List<ProjectActivity> _projectActivities;
  List<DropdownMenuItem<int>> _dropdownList = List();

  ProjectActivitiesStatus get status => _status;
  List<ProjectActivity> get projectActivities => _projectActivities;

  init() async {
    await fetchProjectActivities();
    return this;
  }

  fetchProjectActivities() async {
    ApiResponse _response = await ApiService().fetchProjectActivities();
    _projectActivities =
        projectActivitiesFromResponse(jsonDecode(_response.data));
    _status = ProjectActivitiesStatus.Done;
    notifyListeners();
  }

  getDropdownList() {
    _dropdownList = List();
    _projectActivities.forEach((element) {
      _dropdownList.add(
        DropdownMenuItem(
          child: Text(element.name),
          value: element.id,
        ),
      );
    });
    return _dropdownList;
  }
}
