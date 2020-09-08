import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:timetracker_app/models/timer.dart';
import 'package:timetracker_app/provider/auth.dart';
import 'package:timetracker_app/services/api.dart';

enum TimerStatus { Stopped, Running }

class TimerProvider with ChangeNotifier {
  TimerStatus _status = TimerStatus.Stopped;
  ApiService apiService;
  AuthProvider authProvider;
  String _storageKey = 'tracker';
  Timer _timer;
  SharedPreferences _storage;

  TimerProvider(AuthProvider authProvider) {
    this.apiService = ApiService(authProvider);
    this.authProvider = authProvider;

    init();
  }

  TimerStatus get status => _status;
  Timer get timer => _timer;

  init() async {
    _storage = await SharedPreferences.getInstance();
    var e = _storage.getString(_storageKey);
    if (e != null) {
      _status = TimerStatus.Running;
      notifyListeners();
    }
  }

  startOrPause() {
    switch (_status) {
      case TimerStatus.Stopped:
        start();
        break;
      case TimerStatus.Running:
        stopAndSave();
        break;
    }
    notifyListeners();
  }

  start() {
    _timer = Timer(start: DateTime.now());
    _storage.setString(_storageKey, _timer.toJsonString());
    // _storage.setString(_storageKey, _tracker.toString());
    _status = TimerStatus.Running;
  }

  stopAndSave() {
    _timer = Timer.fromJsonString(_storage.getString(_storageKey));
    _timer.end = DateTime.now();
    _storage.clear();
    _status = TimerStatus.Stopped;
  }
}
