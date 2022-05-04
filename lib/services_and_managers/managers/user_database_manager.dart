

import 'package:flutter/material.dart';
import 'package:medcaremainapp/models/user.dart';
import 'package:medcaremainapp/services_and_managers/services/database_services/user_database.dart';
import 'package:medcaremainapp/utils/service_locator.dart';

class UserDatabaseManager {

  final _userDBService = getIt<UserDatabaseService>();

  void updateUser(AppUser user) async {
    dynamic reference = await _userDBService.updateUserData(user);
    debugPrint(reference ?? "Null");
  }
}