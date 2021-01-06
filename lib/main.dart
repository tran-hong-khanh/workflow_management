import 'package:flutter/material.dart';
import 'screens/detail.dart';
import 'screens/categories.dart';
void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Quản lý chi tiêu',
      theme: ThemeData(
        primarySwatch: Colors.blue,
        visualDensity: VisualDensity.adaptivePlatformDensity,
    ),
      home: Scaffold(
        body: SafeArea(
          child: Center(
            child: Categories()
//            child: Dropdown(),
          )
        )
      )
    );
  }
}