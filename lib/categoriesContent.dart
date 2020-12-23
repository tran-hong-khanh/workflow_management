import 'package:flutter/material.dart';

class Category {
  String content;
  double amount;
  DateTime createdDate;
  //constructor
  Category({this.content, this.amount, this.createdDate});
  @override
  String toString() {
    // TODO: implement toString
    return 'content: $content, amount: $amount';
  }
}
