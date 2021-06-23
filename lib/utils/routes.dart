import 'package:timetracker_app/view/screens/dashboard.dart';
import 'package:timetracker_app/view/screens/login.dart';

class Routes {
  static final routes = {
    login: (context) => LoginScreen(),
    dashboard: (context) => DashboardScreen(),
  };

  static String login = '/login';
  static String dashboard = '/dashboard';
}
