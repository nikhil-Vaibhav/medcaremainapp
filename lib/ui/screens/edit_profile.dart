
import 'package:flutter/material.dart';
import 'package:medcaremainapp/models/app_user_status.dart';
import 'package:medcaremainapp/ui/widgets.dart';
import 'package:medcaremainapp/utils/image_paths.dart';
import 'package:medcaremainapp/utils/service_locator.dart';

import '../../utils/constants.dart';

class EditProfile extends StatelessWidget {
  const EditProfile({ Key? key }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    double _height = MediaQuery.of(context).size.height;
    return Padding(
      padding: EdgeInsets.symmetric(vertical: 20, horizontal: 10),
      child: Column(
        children: [
          Container(
            height: _height/5,
            width: double.infinity,
            child: Image.asset(userImage),
          ),
          const SizedBox(height: 20,),
          //user name
          CustomText(text: "Username", fontSize: 15),
          const SizedBox(height: 20,),
          Container(height: 2, color: const Color.fromARGB(255, 95, 94, 94),),
          const SizedBox(height: 10,),

          ListView.builder(
            itemCount: Constants.userMenuOptions.length,
            itemBuilder: (_, index){
              return Padding(
                padding: const EdgeInsets.all(8.0),
                child: _optionItem(Constants.userMenuOptions[index]),
              );
            })

        ],
      ),
    );
  }

  Widget _optionItem(String itemName) {
    return Container(
      height: 70,
      width: double.infinity,
      color: Colors.green
    );
    return GestureDetector(
    onTap: onTap,
    child: Container(
      decoration: BoxDecoration(
          border: Border.all(color: const Color.fromARGB(255, 230, 229, 229)),
          borderRadius: BorderRadius.circular(10)),
      height: 70,
      width: double.infinity,
      padding: const EdgeInsets.symmetric(vertical: 10, horizontal: 10),
      child: Row(children: [
        const SizedBox(
          width: 5,
        ),
        Container(
          width: 5,
          color: Colors.black,
        ),
        const SizedBox(
          width: 20,
        ),
        Flexible(
            child: Text(
          itemName,
          style: TextStyle(fontSize: 15),
        ))
      ]),
    ),
  );
  }

  void onTap() {

  }
}

