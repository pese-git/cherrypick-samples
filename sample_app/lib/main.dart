import 'package:cherrypick/cherrypick.dart';
import 'package:flutter/material.dart';
import 'package:sample_app/di/repository_module.dart';
import 'package:sample_app/di/scopes.dart';
import 'package:shared_preferences/shared_preferences.dart';

import './app.dart';

void main() async {
  final sharedPreferences = await SharedPreferences.getInstance();

  CherryPick.openScope(scopeName: Scopes.APP_SCOPE).installModules(
    [
      RepositoryModule(sharedPreferences: sharedPreferences),
    ],
  );

  runApp(const App());
}
