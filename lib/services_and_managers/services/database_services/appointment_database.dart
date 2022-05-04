import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:medcaremainapp/utils/constants.dart';

class AppointmentDatabaseService {
  final appointmentCollection =
      FirebaseFirestore.instance.collection(Constants.appointmentCollection);

  Future bookAppointment(Map<String, dynamic> appDetails) async {
    await appointmentCollection.add(appDetails);
  }

  /*
  create model class 
  */
  Future<List<Map<String, dynamic>>> getAppointments(String userId) async {
    List<Map<String, dynamic>> appointments = [];

    appointmentCollection.get().then((QuerySnapshot querySnapshot) {
      for (DocumentSnapshot documentSnapshot in querySnapshot.docs) {
        appointments.add(documentSnapshot.data() as Map<String, dynamic>);
      }
    });
    return appointments;
  }
}
