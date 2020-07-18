import 'package:flutter/material.dart';
import 'package:sikka/services/aunthication.dart';
import 'package:sikka/pages/root_page.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
        title: 'sikka',
        debugShowCheckedModeBanner: false,
        theme:  ThemeData(
          primarySwatch: Colors.blue,
        ),
        home: RootPage(auth:Auth()));
  }
}