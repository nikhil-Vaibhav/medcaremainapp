
import 'package:medcaremainapp/json_object_interface.dart';
import 'package:medcaremainapp/utils/constants.dart';

class ChatMessage extends JSONObjectInterchanger{
  String messageContent;
  String messageType;

  ChatMessage({required this.messageContent, required this.messageType});

  @override
  Map<String, String> toJSON() {
    return {
      Constants.chatMessageContent : messageContent,
      Constants.chatMessageType : messageType,
      Constants.timeStamp : DateTime.now().millisecondsSinceEpoch.toString(),
    };
  }




}