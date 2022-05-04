import 'package:get_it/get_it.dart';
import 'package:medcaremainapp/services_and_managers/services/auth_service.dart';
import 'package:medcaremainapp/services_and_managers/services/database_services/appointment_database.dart';
import 'package:medcaremainapp/services_and_managers/services/database_services/user_database.dart';
import 'package:medcaremainapp/services_and_managers/services/notitfication_service.dart';

final getIt = GetIt.instance;

setUpServiceLocator() {
  getIt.registerLazySingleton<AuthService>(() => AuthService());
  getIt.registerLazySingleton<UserDatabaseService>(() => UserDatabaseService());
  getIt.registerLazySingleton<AppointmentDatabaseService>(() => AppointmentDatabaseService());
  getIt.registerLazySingleton<NotificationService>(() => NotificationService());
}