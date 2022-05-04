
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/foundation.dart';
import 'package:medcaremainapp/services_and_managers/services/auth_service.dart';
import 'package:medcaremainapp/utils/service_locator.dart';

/*
Notifier to respond whether user logged in or not
*/
class AuthNotifier extends ValueNotifier<bool>{
  AuthNotifier(bool value) : super(value);

  final AuthService _authService = getIt<AuthService>();

  Future<bool> signInWithPhone(String phoneNumber) async {
    return await _authService.signInWithPhone(phoneNumber);
  }

  Future<User?> verifyOTP(String otp) async {
    return await _authService.verifyOTP(otp);
  }

  void signInAnon() async {
    dynamic res = await _authService.signInAnon();
    if(res == null) {
      value = false;
    } else {
      value = true;
    }
    notifyListeners();
  }

}