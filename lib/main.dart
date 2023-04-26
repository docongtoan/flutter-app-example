import 'dart:ui';

import 'package:flutter/material.dart';
import 'package:flutter_app_example/screen/home.dart';
import 'package:flutter_app_example/screen/auth/login.dart';
import 'package:flutter_app_example/global.dart';
import 'package:flutter_app_example/library/local_store.dart';
import 'package:flutter_dotenv/flutter_dotenv.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';
import 'package:flutter_localizations/flutter_localizations.dart';

var routers = <String, WidgetBuilder>{
  "/home": (BuildContext context) => const HomeScreen(),
  "/login": (BuildContext context) => const LoginScreen()
};

final global = Global();
final localSore = LibLocalStorage();
void main() async {
  await dotenv.load(fileName: ".env");
  global.connectServer();
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      theme: ThemeData(
          primaryColor: Colors.indigo,
          primarySwatch: Colors.indigo,
          primaryColorDark: Colors.indigo),
      localizationsDelegates: AppLocalizations.localizationsDelegates,
      supportedLocales: AppLocalizations.supportedLocales,
      locale: const Locale('vi'),
      home: localSore.checkLogin('user-item')
          ? const HomeScreen()
          : const LoginScreen(),
      routes: routers,
    );
  }
}
