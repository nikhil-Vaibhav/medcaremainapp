import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:medcaremainapp/models/appointment.dart';
import 'package:medcaremainapp/utils/constants.dart';

class AppointmentDatabaseService {
  final appointmentCollection =
      FirebaseFirestore.instance.collection(Constants.appointmentCollection);

  Future bookAppointment(Appointment appointment) async {
    await appointmentCollection.add(appointment.toJSON());
  }

  /*
  create model class 
  */
  Future<List<Appointment>> getAppointments(String userId) async {
    List<Appointment> appointments = [];

    appointmentCollection.get().then((QuerySnapshot querySnapshot) {
      for (DocumentSnapshot documentSnapshot in querySnapshot.docs) {
        appointments.add(_extractAppointment(documentSnapshot));
      }
    });
    return appointments;
  }

  Appointment _extractAppointment(DocumentSnapshot<Object?> documentSnapshot) {
    Appointment appointment = Appointment(
      doctorID: documentSnapshot.get(Constants.doctorID),
      patientID: documentSnapshot.get(Constants.patientID),
      patientEmail: documentSnapshot.get(Constants.patientEmail),
      patientName: documentSnapshot.get(Constants.patientName),
      patientPhoneNumber: documentSnapshot.get(Constants.patientPhoneNumber),
      price: documentSnapshot.get(Constants.bookPrice)
    );
    return appointment;
  }
}
