import 'package:shared_preferences/shared_preferences.dart';

import 'user.dart';
import 'user_repository.dart';

class PrefUserRepository extends UserRepository {
  final SharedPreferences sharedPreferences;

  static const String KEY_NAME = "KEY_NAME";
  static const String KEY_EMAIL = "KEY_EMAIL";

  PrefUserRepository({required this.sharedPreferences});

  @override
  User getUser() {
    return User(
      name: sharedPreferences.getString(KEY_NAME) ?? '',
      email: sharedPreferences.getString(KEY_EMAIL) ?? '',
    );
  }

  @override
  void saveUser(User user) async {
    await sharedPreferences.setString(KEY_NAME, user.name);
    await sharedPreferences.setString(KEY_EMAIL, user.email);
  }
}
