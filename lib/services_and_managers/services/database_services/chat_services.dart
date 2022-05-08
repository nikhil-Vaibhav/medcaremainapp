import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/cupertino.dart';
import 'package:medcaremainapp/models/chat_message.dart';
import 'package:medcaremainapp/utils/constants.dart';

class ChatService {
  final _chatColllection =
      FirebaseFirestore.instance.collection(Constants.chatCollection);

  Future sendChatMessage(ChatMessage message, String conversationID) async {
    DocumentReference documentReference = _chatColllection
        .doc(conversationID)
        .collection(conversationID)
        .doc(DateTime.now().millisecondsSinceEpoch.toString());

    await documentReference.set(message.toJSON());
    debugPrint("Msg sent");
  }
}
