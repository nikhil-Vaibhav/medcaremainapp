
import 'package:medcaremainapp/services_and_managers/services/database_services/appointment_database.dart';

import '../../utils/service_locator.dart';

class AppointmentManager {

  final _appointmentManager = getIt<AppointmentDatabaseService>();

  void bookAppointment(Map<String, dynamic> appDetails) async {
    await _appointmentManager.bookAppointment(appDetails);
  }

  Future<List<Map<String, dynamic>>> getAppointments(String userID) async {
    return await _appointmentManager.getAppointments(userID);
  }
}