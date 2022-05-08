import 'package:flutter/material.dart';
import 'package:medcaremainapp/utils/constants.dart';

class SettingsPage extends StatefulWidget {
  const SettingsPage({Key? key}) : super(key: key);

  @override
  State<SettingsPage> createState() => _SettingsPageState();
}

class _SettingsPageState extends State<SettingsPage> {
  @override
  Widget build(BuildContext context) {
    return Column(children: [
      const SizedBox(
        height: 20,
      ),
      Expanded(
        child: ListView.builder(
            itemCount: Constants.settings.length,
            itemBuilder: (context, index) {
              return Padding(
                  padding: const EdgeInsets.all(8),
                  child: SettingsItemWidget(index, Constants.settings[index]));
            }),
      )
    ]);
  }
}

//clicking a settings item
void onTap() {}

Widget SettingsItemWidget(int index, String itemName) {
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
