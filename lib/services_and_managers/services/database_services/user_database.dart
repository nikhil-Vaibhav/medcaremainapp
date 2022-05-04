import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:medcaremainapp/models/user.dart';

import '../../../utils/constants.dart';

class UserDatabaseService {
  //collection ref
  final CollectionReference userCollection =
      FirebaseFirestore.instance.collection(Constants.userCollection);

  Future updateUserData(AppUser user) async {
    return await userCollection.doc(user.uid).set({
      Constants.userId : user.uid,
      Constants.name : user.name,
      Constants.email: user.email,
      Constants.phoneNumber : user.phoneNumber
    });
  }

  Future<bool> checkIfUserExists(String phoneNumber) async {
    bool result = false;
    await userCollection.get()
    .then((QuerySnapshot querySnapshot) => {
      querySnapshot.docs.forEach((document) {
        if(document.get(Constants.phoneNumber)  == phoneNumber) {
          result = true;
        }
      })
    });
    return result;
  }
}
