

import 'package:flutter/material.dart';
import 'package:medcaremainapp/models/user.dart';
import 'package:medcaremainapp/services_and_managers/services/database_services/user_database.dart';
import 'package:medcaremainapp/utils/service_locator.dart';

import '../../models/appointment.dart';
import '../services/database_services/appointment_database.dart';

class DatabaseManager {

  final _userDBService = getIt<UserDatabaseService>();
  final _appointmentService = getIt<AppointmentDatabaseService>();

  //User services
  void updateUser(AppUser user) async {
    dynamic reference = await _userDBService.updateUserData(user);
    debugPrint(reference ?? "Null");
  }

  //Appointment services
  void bookAppointment(Appointment appointment) async {
    await _appointmentService.bookAppointment(appointment);
  }

  Future<List<Appointment>> getAppointments(String userID) async {
    return await _appointmentService.getAppointments(userID);
  }
}