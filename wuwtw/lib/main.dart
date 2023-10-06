import 'package:flutter/material.dart';
import 'package:wuwtw/pages/home.dart';

void main() async{
  WidgetsFlutterBinding.ensureInitialized();

  //await UserPreferences.init();

  runApp(
      MaterialApp(
        debugShowCheckedModeBanner: false,
        initialRoute: '/',
        routes: {
          '/': (context) => const Home(),
        },
      )
  );
}