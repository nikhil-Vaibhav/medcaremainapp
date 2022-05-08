import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:medcaremainapp/models/user.dart';

import '../../../models/app_user_status.dart';
import '../../../utils/constants.dart';
import '../../../utils/service_locator.dart';

class UserDatabaseService {
  //collection ref
  final CollectionReference userCollection =
      FirebaseFirestore.instance.collection(Constants.userCollection);

  Future updateUserData(AppUser user) async {
    return await userCollection.doc(user.uid).set(user.toJSON());
  }

  Future<bool> checkIfUserExists(String phoneNumber) async {
    bool result = false;
    await userCollection.get()
    .then((QuerySnapshot querySnapshot)  {
      querySnapshot.docs.forEach((document) {
        if(document.get(Constants.phoneNumber)  == phoneNumber) {
          result = true;
          getIt<CurrentAppUser>().uid = document.get(Constants.userId);
        }
      });
    });
    return result;
  }
}
