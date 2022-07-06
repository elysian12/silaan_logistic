import 'package:shared_preferences/shared_preferences.dart';
import 'package:silaan_logistic/app/common/constants/keys.dart';

class SharedService {
  void setSharedUUID(String uuid) async {
    final prefs = await SharedPreferences.getInstance();
    prefs.setString(SharedKeys.sharedUUID, uuid);
  }

  void setSharedRole(String role) async {
    final prefs = await SharedPreferences.getInstance();
    prefs.setString(SharedKeys.role, role);
  }

  Future<String?> getSharedUUID() async {
    final prefs = await SharedPreferences.getInstance();
    return prefs.getString(SharedKeys.sharedUUID);
  }

  Future<String?> getSharedRole() async {
    final prefs = await SharedPreferences.getInstance();
    return prefs.getString(SharedKeys.role);
  }

  //remove
  Future<bool> removeSharedServices() async {
    final prefs = await SharedPreferences.getInstance();
    return await prefs.clear();
  }
}
