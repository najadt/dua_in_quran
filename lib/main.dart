import 'package:dua_in_quran/dua_page.dart';
import 'package:dua_in_quran/splash.dart';
import 'package:flutter/material.dart';

void main() {
  runApp(MaterialApp(
    debugShowCheckedModeBanner: false,
    home: const SplashScreen(),
    theme: ThemeData(primarySwatch: Colors.teal),
  ));
}

class HomePage extends StatelessWidget {
  const HomePage({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return const DuaPage();
  }
}
