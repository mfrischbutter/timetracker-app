import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:timetracker_app/api/api_reponse.dart';
import 'package:timetracker_app/api/service.dart';
import 'package:timetracker_app/models/project.dart';

enum ProjectsStatus {
  Uninitialized,
  Loading,
  Done,
}

class ProjectsProvider extends ChangeNotifier {
  ProjectsStatus _status = ProjectsStatus.Uninitialized;
  List<Project> _projects;
  List<DropdownMenuItem<int>> _dropdownList = List();

  ProjectsStatus get status => _status;
  List<Project> get projects => _projects;

  init() async {
    await fetchProjects();
    return this;
  }

  fetchProjects() async {
    ApiResponse _response = await ApiService().fetchProjects();
    _projects = projectsFromResponse(jsonDecode(_response.data));
    _status = ProjectsStatus.Done;
    notifyListeners();
  }

  getDropdownListByCustomer(customerId) {
    _dropdownList = List();
    _projects.forEach((element) {
      if (element.active == 0 ||
          (element.customer != customerId && element.global == 0)) {
        return;
      }
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
