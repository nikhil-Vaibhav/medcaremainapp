import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:medcaremainapp/utils/constants.dart';
import 'package:medcaremainapp/utils/image_paths.dart';

import '../services_and_managers/managers/search_manager.dart';
import '../utils/service_locator.dart';

class CustomDrawer extends StatefulWidget {
  const CustomDrawer({Key? key}) : super(key: key);

  @override
  State<CustomDrawer> createState() => _CustomDrawerState();
}

class _CustomDrawerState extends State<CustomDrawer> {
  int _selectedIndex = 0;
  bool _isExpanded = false;

  @override
  Widget build(BuildContext context) {
    return Drawer(
        backgroundColor: Colors.blue,
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

    List<Widget> tileWidgets = [];
    tileWidgets.add(DrawerHeader(child: Image.asset(userImage)));

    //Add icon and titles to the each expansio tile and add them to list
    for (int i = 0; i < iconWidgets.length; i++) {
      tileWidgets.add(ExpansionTile(
        leading: iconWidgets[i],
        title: Text(
          Constants.careTitles[i],
          style: const TextStyle(color: Colors.white),
        ),
        onExpansionChanged: (expanded) {
          setState(() {
            _isExpanded = expanded;
            _selectedIndex = i;
          });
        },
        children: _getListTiles(i),
        trailing: Icon(
          _isExpanded && (_selectedIndex == i)
              ? Icons.arrow_circle_down //if this tile is selected
              : Icons.arrow_circle_right, //if this tile is not selected
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

//Search bar widget
class SearchBar extends StatefulWidget {
  const SearchBar({Key? key}) : super(key: key);

  @override
  State<SearchBar> createState() => _SearchBarState();
}

class _SearchBarState extends State<SearchBar> {
  final TextEditingController _searchController = TextEditingController();
  final _searchManager = getIt<SearchManager>();

  String _textSearch = "";
  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.all(10),
      height: 50,
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          SizedBox(
            width: 10,
          ),
          Icon(Icons.search),
          SizedBox(width: 5),
          Expanded(
              child: TextFormField(
            textInputAction: TextInputAction.search,
            controller: _searchController,
            decoration: const InputDecoration.collapsed(
              hintText: 'Search here...',
              hintStyle: TextStyle(color: Colors.black),
            ),
            onChanged: (value) {
              if (value.isNotEmpty) {
                _textSearch = value;
              } else {
                _textSearch = "";
              }
              //notify list view to change accordingly
              _searchManager.searchNotifer.setValue(_textSearch);
            },
          )),
        ],
      ),
      decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(10),
          color: Color.fromARGB(255, 243, 234, 234)),
    );
  }
}

//home page scrollable row widget
class HomeRow extends StatefulWidget {
  String title;
  int position;
  HomeRow({Key? key, this.position = 0, this.title = ""}) : super(key: key);

  @override
  State<HomeRow> createState() => _HomeRowState(title, position);
}

class _HomeRowState extends State<HomeRow> {
  String title = "";
  int position = 0;
  _HomeRowState(this.title, this.position);

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 150,
      width: double.infinity,
      padding: const EdgeInsets.symmetric(vertical: 5.0, horizontal: 8.0),
      child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Row(children: [
              Expanded(
                  child: Text(title,
                      style: const TextStyle(
                        fontSize: 20.0,
                      ))),
              Expanded(
                child: Align(
                    alignment: Alignment.centerRight,
                    child: GestureDetector(
                        onTap: () {
                          print("Tapped");
                        },
                        child: Container(
                          height: 15,
                          width: 100,
                          child: const Text("View All",
                              textAlign: TextAlign.end,
                              style: TextStyle(
                                color: Colors.lightBlue,
                              )),
                        ))),
              ),
            ]),
            const SizedBox(
              height: 10.0,
            ),
            Container(
                height: 100,
                child: ListView.builder(
                  scrollDirection: Axis.horizontal,
                  itemCount: 10,
                  itemBuilder: ((context, index) {
                    return _buildSingleItem(position, index);
                  }),
                )),
            const SizedBox(
              height: 5.0,
            ),
          ]),
    );
  }

  Widget _buildSingleItem(int list_position, int index) {
    return Container(
      width: 80,
      height: 150,
      child: Column(
        children: [
          FadeInImage.assetNetwork(
              placeholder: placeholderImage,
              image: "https://picsum.photos/70?image=9"),
          Text(
            "Item",
            textAlign: TextAlign.start,
          ),
        ],
      ),
    );
  }
}

AppBar CustomAppBar(BuildContext context, String title) {
  return AppBar(
    backgroundColor: const Color.fromARGB(255, 227, 116, 247),
    leading: GestureDetector(
        onTap: () {
          Navigator.pop(context);
        },
        child: const Padding(
          padding: EdgeInsets.symmetric(vertical: 0.0, horizontal: 7),
          child: Icon(
            Icons.arrow_back_ios,
            size: 30.0,
          ),
        )),
    title: Row(
      children: [
        Container(
          height: 35,
          width: 35,
          decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(30),
              image: const DecorationImage(
                  image: AssetImage(userImage), fit: BoxFit.cover),
              border: Border.all(color: Colors.grey)),
        ),
        const SizedBox(
          width: 8,
        ),
        Text(title,
            style: const TextStyle(
              fontSize: 18,
              color: Colors.black,
            ))
      ],
    ),
  );
}

Widget CustomText(
    {required String text,
    double fontSize = 15,
    Color fontColor = Colors.black}) {
  return Text(
    text,
    style: TextStyle(fontSize: fontSize, color: fontColor),
  );
}
