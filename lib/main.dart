import 'package:flutter/material.dart';
import 'dropdownButton.dart';
import 'categories.dart';
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
//class addButton extends StatelessWidget {
//  @override
//  Widget build(BuildContext context) {
//    void _showModal() {
//      showModalBottomSheet<void>(
//        context: context,
//        builder: (BuildContext context) {
//          return Container(height: 200.0, child: Dropdown());
//        },
//      );
//    }
//    return Scaffold(
//        floatingActionButton: FloatingActionButton(
//          onPressed: () {
//            _showModal();
//          },
//          child: Icon(Icons.add),
//          backgroundColor: Colors.green,
//        ),
//        body: Text("hello")
//    );
//  }
//}