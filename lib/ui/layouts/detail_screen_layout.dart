
import 'package:flutter/material.dart';

class DetailScreenLayout extends StatelessWidget {
  String pageTitle ;
  Widget bodyWidget;
  DetailScreenLayout({ Key? key, this.pageTitle="" , required this.bodyWidget}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
          backgroundColor: Colors.blue,
          leading: GestureDetector(
              onTap: () {
                Navigator.pop(context);
              },
              child: const Padding(
                padding:  EdgeInsets.symmetric(vertical: 0.0, horizontal: 12),
                child: Icon(
                  Icons.arrow_back_ios,
                  size: 30.0,
                ),
              )),
              title: Text(pageTitle),
        ),
    );
  }
}