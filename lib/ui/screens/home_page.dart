import 'package:flutter/material.dart';

import 'package:medcaremainapp/services_and_managers/managers/search_manager.dart';
import 'package:medcaremainapp/services_and_managers/services/notitfication_service.dart';
import 'package:medcaremainapp/utils/constants.dart';
import 'package:medcaremainapp/utils/routes.dart';

import '../../utils/service_locator.dart';
import '../widgets.dart';

class HomePage extends StatefulWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
        child: Column(children: _getListOfWidgets(),)
        // child: ListView.builder(
        //   itemCount: ,
        //   itemBuilder: ),
      );
  }

  List<Widget> _getListOfWidgets() {
    List<Widget> widgets = [];

    for(int i=1; i<Constants.careTitles.length; i++) {
      widgets.add(
        Container(
                height: 230,
                padding: const EdgeInsets.symmetric(vertical: 12.0, horizontal: 12.0),
                child: HomeRow(
                  position: i,
                  title: Constants.careTitles[i],
                )),
      );
    }
    return widgets;
  }
  
}
