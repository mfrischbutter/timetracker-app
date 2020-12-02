import 'package:flutter_secure_storage/flutter_secure_storage.dart';
import 'package:get_it/get_it.dart';
import 'package:timetracker_app/provider/activties.dart';
import 'package:timetracker_app/provider/auth.dart';

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
}
