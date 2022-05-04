import 'package:flutter/material.dart';
import 'package:medcaremainapp/utils/constants.dart';

class CustomDrawer extends StatelessWidget {
  const CustomDrawer({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Drawer(
        backgroundColor: Colors.purple,
        child: ListView(
          children: _getWidgetList(),
        ));
  }

  //todo : drawer header
  List<Widget> _getWidgetList() {
    List<Widget> iconWidgets = const [
      Icon(Icons.home),
      Icon(Icons.health_and_safety),
      Icon(Icons.pregnant_woman),
      Icon(Icons.soap),
      Icon(Icons.bedroom_baby),
      Icon(Icons.home),
      Icon(Icons.star),
      Icon(Icons.shopping_bag),
      Icon(Icons.card_giftcard)
    ];

    debugPrint(Constants.healthCareList.length.toString());
    List<Widget> tileWidgets = [];
    tileWidgets.add(const DrawerHeader(child: Icon(Icons.home)));

    //Add icon and titles to the each expansio tile and add them to list
    for (int i = 0; i < iconWidgets.length; i++) {
      tileWidgets.add(ExpansionTile(
        leading: iconWidgets[i],
        title: Text(
          Constants.careTitles[i],
          style: const TextStyle(color: Colors.white),
        ),
        children: _getListTiles(i),
        trailing: const Icon(
          Icons.arrow_forward_ios,
          color: Colors.white,
        ),
      ));
    }

    return tileWidgets;
  }

  List<Widget> _getListTiles(int pos) {
    List<Widget> listTiles = [];


    for (int i = 0; i < Constants.healthCareList[pos].length; i++) {
      listTiles.add(ListTile(
          title: Text(Constants.healthCareList[pos][i]),
          trailing: const Icon(
            Icons.arrow_forward_ios,
            color: Colors.white,
          )));
    }
    return listTiles;
  }
}
