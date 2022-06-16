import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';

import 'app.dart';
import 'theme_repository.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  final themeRepository = ThemeRepository(
    sharedPreferences: await SharedPreferences.getInstance(),
  );
  runApp(App(themeRepository: themeRepository));
}
