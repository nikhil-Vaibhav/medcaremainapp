import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:medcaremainapp/services_and_managers/managers/chat_manager.dart';
import 'package:medcaremainapp/ui/widgets.dart';
import 'package:medcaremainapp/utils/constants.dart';
import 'package:flutter/material.dart';
import 'package:medcaremainapp/utils/routes.dart';

import '../../models/app_user_status.dart';
import '../../services_and_managers/managers/search_manager.dart';
import '../../utils/service_locator.dart';

class ChatListScreen extends StatefulWidget {
  const ChatListScreen({Key? key}) : super(key: key);

  @override
  State<ChatListScreen> createState() => _ChatListScreenState();
}

/*
todo : get list of doctors from database and add to list view
*/
class _ChatListScreenState extends State<ChatListScreen> {
  final _searchManager = getIt<SearchManager>();
  @override
  Widget build(BuildContext context) {
    return Column(
        children: [
          const SearchBar(),
          Expanded(
            child: ValueListenableBuilder<String>(
                valueListenable: _searchManager.searchNotifer,
                builder: (_, value, __) {
                  
                  return StreamBuilder(
                      stream: ChatManager().getMessages(
                          getIt<CurrentAppUser>().uid, 20),
                      builder:
                          ((context, AsyncSnapshot<QuerySnapshot> snapshot) {
                        List<String> list = _filterList(value, snapshot);

                        return ListView.builder(
                            itemCount: list.length,
                            itemBuilder: (context, index) {
                              return ListTile(
                                title: Text(list[index]),
                                onTap: (){
                                  Navigator.pushNamed(context, Routes.chatMainScreenRoute);
                                },
                              );
                            });
                      }));
                }),
          )
        ],
      );
  }

  List<String> _filterList(
      String filter, AsyncSnapshot<QuerySnapshot> snapshot) {
    List<String> filteredList = [];

    if (snapshot.data != null) {
      for (var d in snapshot.data!.docs) {
        String c = d.get(Constants.chatMessageContent);
        if (c.contains(filter)) {
          filteredList.add(c);
        }
      }
    }
    return filteredList;
  }
}
