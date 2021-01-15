import 'package:flutter/material.dart';
import 'detail.dart';
import 'package:intl/intl.dart';

Widget CategoryDrawer(context, data){
  return InkWell(
      onTap: () {
        Navigator.push(
          context,
          MaterialPageRoute(builder: (context) => Detail(),
            settings: RouteSettings(
            arguments: data,
          ),),
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
                    data.content,
                    style: TextStyle(
                      fontWeight: FontWeight.w400,
                      fontSize: 20,),
                  ),
                  Padding(padding: EdgeInsets.only(top: 10)),
                  Text(
                      data.createdDate,
                      style: TextStyle(fontSize: 16)),
                  Padding(padding: EdgeInsets.only(bottom: 10)),
                ],
              ),
            ],
          ))
  );
}
