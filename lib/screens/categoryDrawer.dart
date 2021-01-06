import 'package:flutter/material.dart';
import 'detail.dart';
import 'package:intl/intl.dart';

class CategoryDrawer extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    //Now how to make this "Scrollable", let use ListView:
    //1.ListView(children: <Widget>[]) => this loads all children at the same time
    //2.ListView(itemBuilder: ...) => this loads only visible items
    return InkWell(
        onTap: () {
          Navigator.push(
            context,
            MaterialPageRoute(builder: (context) => Detail()),
          );
        },
        child: Card(
            shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(1)),
            color: Colors.grey[200],
//        elevation: 10,
            //this lesson will customize this ListItem, using Column and Row
            child: Row(
              mainAxisAlignment: MainAxisAlignment.start,
              children: <Widget>[
                Padding(
                  padding: EdgeInsets.all(10),
                ),
                Column(
                  mainAxisAlignment: MainAxisAlignment.start,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: <Widget>[
                    Padding(padding: EdgeInsets.only(top: 10)),
                    Text(
                      "content",
                      style: TextStyle(
                        fontWeight: FontWeight.w400,
                        fontSize: 20,),
                    ),
                    Padding(padding: EdgeInsets.only(top: 10)),
                    Text(
                        'Date: ${DateFormat.yMd().format(DateTime.now())}',
                        style: TextStyle(fontSize: 16)),
                    Padding(padding: EdgeInsets.only(bottom: 10)),
                  ],
                ),
              ],
            ))
    );
  }
}