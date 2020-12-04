import 'package:get_it/get_it.dart';
import 'package:timetracker_app/provider/activties.dart';
import 'package:timetracker_app/provider/auth.dart';
import 'package:timetracker_app/provider/customers.dart';
import 'package:timetracker_app/provider/project_activities.dart';
import 'package:timetracker_app/provider/projects.dart';

GetIt services = GetIt.instance;

initServices() {
  services.registerSingletonAsync<AuthProvider>(
    () async => await AuthProvider().init(),
  );
  services.registerSingletonAsync<ActivitiesProvider>(
      () async => ActivitiesProvider(),
      dependsOn: [
        AuthProvider,
      ]);
  services.registerSingletonAsync<ProjectActivitiesProvider>(
      () async => ProjectActivitiesProvider(),
      dependsOn: [
        AuthProvider,
      ]);
  services.registerSingletonAsync<CustomersProvider>(
      () async => CustomersProvider(),
      dependsOn: [
        AuthProvider,
      ]);
  services.registerSingletonAsync<ProjectsProvider>(
      () async => ProjectsProvider(),
      dependsOn: [
        AuthProvider,
      ]);
}
