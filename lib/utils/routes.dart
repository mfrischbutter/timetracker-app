import 'package:timetracker_app/view/screens/dashboard.dart';
import 'package:timetracker_app/view/screens/login.dart';
import 'package:timetracker_app/view/screens/start_activity.dart';

class Routes {
  static final routes = {
    login: (context) => LoginScreen(),
    dashboard: (context) => DashboardScreen(),
    startActivity: (context) => StartActivityScreen(),
  };

  static String login = '/login';
  static String dashboard = '/dashboard';
  static String startActivity = '/startActivity';
}
