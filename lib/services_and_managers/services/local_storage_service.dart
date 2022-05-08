
import 'package:shared_preferences/shared_preferences.dart';

class LocalStorageService {

  Future saveData(Map<String,dynamic> data) async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    for(String key in data.keys) {
      prefs.setString(key, data[key]);
    }
    print("Saved !!!!!");
  }

  Future<Map<String,dynamic>> extractData() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    // print(prefs.getString("name") ?? " ");
    Map<String,dynamic> data = {
      "name" : prefs.getString("name") ?? " "
    };
    print("YAha -> ${data["name"]}");
    return data;
  }
}