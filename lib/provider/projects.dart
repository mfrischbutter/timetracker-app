import 'package:flutter/material.dart';
import 'package:timetracker_app/models/projects.dart';
import 'package:timetracker_app/provider/auth.dart';
import 'package:timetracker_app/services/api.dart';
import 'package:timetracker_app/utils/projects_response.dart';
import 'package:timetracker_app/utils/exceptions.dart';

class ProjectsProvider with ChangeNotifier {
  bool _initialized = false;

  ApiService apiService;
  AuthProvider authProvider;

  List<Projects> _projects = List<Projects>();

  bool get initialized => _initialized;
  List<Projects> get projects => _projects;

  ProjectsProvider(AuthProvider authProvider) {
    this.apiService = ApiService(authProvider);
    this.authProvider = authProvider;

    getProjects();
  }

  void getProjects() async {
    try {
      ProjectsResponse getProjectsResponse = await apiService.getProjects();

      _initialized = true;
      _projects = getProjectsResponse.projects;

      notifyListeners();
    } on AuthException {
      // API returned a AuthException, so user is logged out.
      await authProvider.logOut(true);
    } catch (Exception) {
      print(Exception);
    }
  }
}
