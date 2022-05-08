
import 'package:medcaremainapp/json_object_interface.dart';

import '../utils/constants.dart';

class AppUser extends JSONObjectInterchanger {
  String? uid;
  String? phoneNumber;
  String? name;
  String? email;

  AppUser({this.uid, this.name, this.email, this.phoneNumber});

  @override
  Map<String, String> toJSON() {
    return {
      Constants.userId : uid ?? "",
      Constants.name : name ?? "",
      Constants.email: email ?? "",
      Constants.phoneNumber : phoneNumber ?? ""
    };
  }

  //check for method which returns json to object


}