import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:medcaremainapp/models/app_user_status.dart';
import 'package:medcaremainapp/models/chat_message.dart';
import 'package:medcaremainapp/services_and_managers/managers/chat_manager.dart';
import 'package:medcaremainapp/services_and_managers/managers/local_storage_manager.dart';
import 'package:medcaremainapp/services_and_managers/services/database_services/chat_services.dart';
import 'package:medcaremainapp/ui/widgets.dart';
import 'package:medcaremainapp/utils/constants.dart';
import 'package:medcaremainapp/utils/service_locator.dart';

class ChatScreen extends StatefulWidget {
  const ChatScreen({Key? key}) : super(key: key);

  @override
  State<ChatScreen> createState() => _ChatScreenState();
}

final String currentUserID = getIt<CurrentAppUser>().uid;

class _ChatScreenState extends State<ChatScreen> {
  final _chatManager = ChatManager();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: CustomAppBar(context, "Title"),
        body: Padding(
          padding: const EdgeInsets.all(8.0),
          child: Column(
            children: [
              Flexible(
                  //Add chat manager and listen to messages
                  child: StreamBuilder(
                stream: _chatManager.getMessages(currentUserID, 20),
                builder: (context, AsyncSnapshot<QuerySnapshot> snapshot) {
                  if (snapshot.hasData) {
                    print(snapshot.data?.docs.length);
                    return ListView.builder(
                        scrollDirection: Axis.vertical,
                        padding: const EdgeInsets.all(10),
                        itemCount: snapshot.data?.docs.length,
                        itemBuilder: ((context, index) {
                          return ListTile(
                            title: Text(
                              //set message content
                              snapshot.data?.docs[index]
                                  .get(Constants.chatMessageContent),
                              //align according to type of message
                              textAlign: _customAlign(snapshot.data?.docs[index]
                                  .get(Constants.chatMessageType)),
                            ),
                          );
                        }));
                  } else {
                    return Container();
                  }
                },
              )),
              buildMessageInput()
            ],
          ),
        ));
  }

  TextAlign _customAlign(String messageType) {
    if (messageType == Constants.typeReceiver) return TextAlign.start;
    return TextAlign.end;
  }
}

Widget buildMessageInput() {
  final TextEditingController textEditingController = TextEditingController();

  return SizedBox(
    width: double.infinity,
    height: 50,
    child: Row(
      children: [
        Container(
          margin: const EdgeInsets.only(right: 4.0),
          decoration: BoxDecoration(
            color: Colors.purple,
            borderRadius: BorderRadius.circular(30),
          ),
          child: IconButton(
            onPressed: () {},
            icon: const Icon(
              Icons.camera_alt,
              size: 28.0,
            ),
            color: Colors.white,
          ),
        ),
        Flexible(
            child: TextField(
          textInputAction: TextInputAction.send,
          keyboardType: TextInputType.text,
          textCapitalization: TextCapitalization.sentences,
          controller: textEditingController,
          onSubmitted: (value) {},
        )),
        Container(
          margin: const EdgeInsets.only(left: 4.0),
          decoration: BoxDecoration(
            color: Colors.purple,
            borderRadius: BorderRadius.circular(30.0),
          ),
          child: IconButton(
            onPressed: () {
              //Send message : create method
              ChatMessage cm = ChatMessage(
                  messageContent: textEditingController.text,
                  messageType: Constants.typeSender);

              textEditingController.clear();
              ChatService().sendChatMessage(cm, currentUserID);
            },
            icon: const Icon(Icons.send_rounded),
            color: Colors.white,
          ),
        ),
      ],
    ),
  );
}

Widget buildItem() {
  return const Scaffold();
}
