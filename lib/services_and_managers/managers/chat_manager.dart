import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';

import '../../utils/constants.dart';

class ChatManager {

  Stream<QuerySnapshot> getMessages(String conversationID, int limit) {
    return FirebaseFirestore.instance
        .collection(Constants.chatCollection)
        .doc(conversationID)
        .collection(conversationID)
        .limit(limit)
        .snapshots();
  }
}
