import 'package:streaming_shared_preferences/streaming_shared_preferences.dart';

// TODO: Currently the settings are not user specific
class SettingsProvider {
  StreamingSharedPreferences _preferences;

  /// 0=3; 1=7; 2=31 Days
  Preference<int> get daysToFilterActivities =>
      _preferences.getInt('daysToFilterActivities', defaultValue: 1);
  set daysToFilterActivities(val) {
    _preferences.setInt('daysToFilterActivities', val);
  }

  Future<SettingsProvider> init() async {
    _preferences = await StreamingSharedPreferences.instance;
    return this;
  }
}
