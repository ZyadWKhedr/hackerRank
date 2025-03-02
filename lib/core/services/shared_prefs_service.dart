import 'package:shared_preferences/shared_preferences.dart';
import '../../domain/entities/user.dart';

class SharedPrefsService {
  Future<void> saveUser(AppUser user) async {
    final prefs = await SharedPreferences.getInstance();
    prefs.setString('user_id', user.id);
    prefs.setString('user_name', user.name);
    prefs.setString('user_email', user.email);
  }

  Future<AppUser?> getUser() async {
    final prefs = await SharedPreferences.getInstance();
    final id = prefs.getString('user_id');
    final name = prefs.getString('user_name');
    final email = prefs.getString('user_email');

    if (id != null && name != null && email != null) {
      return AppUser(id: id, name: name, email: email);
    }
    return null;
  }

  Future<void> clearUser() async {
    final prefs = await SharedPreferences.getInstance();
    prefs.clear();
  }
}
