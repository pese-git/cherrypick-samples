import 'package:shared_preferences/shared_preferences.dart';

import 'user.dart';
import 'user_repository.dart';

class PrefUserRepository extends UserRepository {
  final SharedPreferences sharedPreferences;

  static const String keyName = "KEY_NAME";
  static const String keyEmail = "KEY_EMAIL";

  PrefUserRepository({required this.sharedPreferences});

  @override
  User getUser() {
    return User(
      name: sharedPreferences.getString(keyName) ?? '',
      email: sharedPreferences.getString(keyEmail) ?? '',
    );
  }

  @override
  void saveUser(User user) async {
    await sharedPreferences.setString(keyName, user.name);
    await sharedPreferences.setString(keyEmail, user.email);
  }
}
