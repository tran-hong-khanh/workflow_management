import 'package:flutter/material.dart';

class Category {
  int id;
  String content;
  double amount;
  String createdDate;
  //constructor
  Category({this.id, this.content, this.amount, this.createdDate});
  @override
  String toString() {
    // TODO: implement toString
    return 'content: $content, amount: $amount';
  }

  factory Category.fromDatabaseJson(Map<String, dynamic> data) => Category(
    //This will be used to convert JSON objects that
    //are coming from querying the database and converting
    //it into a Todo object
        id: data['id'],
        content: data['content'],
        amount: data['amount'],
        //Since sqlite doesn't have boolean type for true/false
        //we will 0 to denote that it is false
        //and 1 for true
        createdDate: data['createdDate'],
      );
  Map<String, dynamic> toDatabaseJson() => {
    //This will be used to convert Todo objects that
    //are to be stored into the datbase in a form of JSON
        "id": this.id,
        "content": this.content,
        "amount": this.amount,
        "createdDate": this.createdDate,
      };
}
