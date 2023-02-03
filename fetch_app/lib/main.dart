import 'package:fetch_app/first_page.dart';
import 'package:fetch_app/main_page.dart';
import 'package:flutter/material.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
        routes: {
          '/':(context)=>firstPage(),
          '/main':(context)=>mainPage(),
        }
    );
  }
}

