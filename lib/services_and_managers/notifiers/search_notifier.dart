
import 'package:flutter/cupertino.dart';

class SearchNotifier extends ValueNotifier<String> {
  SearchNotifier(String value) : super(value);

  void setValue(String searchText) {
    value = searchText;
    notifyListeners();
  }

}