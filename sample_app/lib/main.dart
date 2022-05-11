import 'package:cherrypick/cherrypick.dart';
import 'package:flutter/material.dart';
import 'package:sample_app/di/user_module.dart';
import 'package:sample_app/di/scopes.dart';
import 'package:shared_preferences/shared_preferences.dart';

import './app.dart';

void main() async {
  final sharedPreferences = await SharedPreferences.getInstance();

  final appScope = CherryPick.openScope(scopeName: Scopes.appScope);

  appScope.installModules(
    [
      UserModule(sharedPreferences: sharedPreferences),
    ],
  );

  runApp(const App());
}
