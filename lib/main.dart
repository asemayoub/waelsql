import 'package:flutter/material.dart';
import 'package:waelsql/home.dart';

import 'package:sqflite/sqflite.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'SQL FLite',
      home: homePage(),
    );
  }
}

