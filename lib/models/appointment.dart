import 'package:medcaremainapp/json_object_interface.dart';
import 'package:medcaremainapp/utils/constants.dart';

class Appointment extends JSONObjectInterchanger {
  String? doctorID;
  DateTime? dateTime;
  String? patientID;
  String? patientName;
  String? patientEmail;
  String? patientPhoneNumber;
  double? price;

  Appointment(
      {this.doctorID,
      this.dateTime,
      this.patientEmail,
      this.patientID,
      this.patientName,
      this.patientPhoneNumber,
      this.price=0.0});

  @override
  Map<String, String> toJSON() {
    return {
      Constants.doctorID : doctorID ?? "",
      Constants.patientID : patientID ?? "",
      Constants.patientEmail : patientEmail ?? "",
      Constants.patientName : patientName ?? "",
      Constants.patientPhoneNumber : patientPhoneNumber ?? "",
      Constants.bookPrice : price.toString(),
      Constants.dateTime : dateTime.toString()
    };
  }

  
}
