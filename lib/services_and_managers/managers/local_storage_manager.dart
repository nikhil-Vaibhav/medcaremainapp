

import 'package:medcaremainapp/services_and_managers/services/local_storage_service.dart';
import 'package:medcaremainapp/utils/service_locator.dart';

class LocalStorageManager {

  final _storageService = getIt<LocalStorageService>();

  void saveData(Map<String,dynamic> data) async {
    await _storageService.saveData(data);
  }

  Future<Map<String, dynamic>> extractData() async {
    return await _storageService.extractData();
  }
}