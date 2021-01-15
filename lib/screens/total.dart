import 'package:flutter/material.dart';
import '../models/categoriesModel.dart';

class Total extends StatelessWidget {
  Total( {Key key, this.category} ) : super(key: key);
  double category;
  @override
  Widget build(BuildContext context) {
    return Column(mainAxisAlignment: MainAxisAlignment.center, children: <Widget>[
      Row(mainAxisAlignment: MainAxisAlignment.start, children: <Widget>[
        Text("Tổng thu:", style: TextStyle(fontSize: 18, color: Colors.orange),),
        Padding(
          padding: EdgeInsets.symmetric(
            vertical: 0,
            horizontal: 6.0,
          ),
        ),
        Expanded(
            child: Row(mainAxisAlignment: MainAxisAlignment.end, children: <Widget>[
              Text(category.toString(), style: TextStyle(fontSize: 18, color: Colors.orange),),
              Padding(
                padding: EdgeInsets.symmetric(
                  vertical: 0,
                  horizontal: 6.0,
                ),
              ),
              Text("Vnd", style: TextStyle(fontSize: 18, color: Colors.orange),)
            ])
        ),
        Padding(
          padding: EdgeInsets.symmetric(
            vertical: 0,
            horizontal: 46.0,
          ),
        ),
      ]),
      Container(
        margin: const EdgeInsets.only(top: 5),
        color: Colors.black,
        width: MediaQuery.of(context).size.width,
        height: 1,
      ),
      Padding(
        padding: EdgeInsets.symmetric(
          vertical: 6.0,
          horizontal: 0,
        ),
      ),
      Row(mainAxisAlignment: MainAxisAlignment.start, children: <Widget>[
        Text("Tổng chi:", style: TextStyle(fontSize: 18, color: Colors.orange),),
        Padding(
          padding: EdgeInsets.symmetric(
            vertical: 0,
            horizontal: 6.0,
          ),
        ),
        Expanded(
            child: Row(mainAxisAlignment: MainAxisAlignment.end, children: <Widget>[
              Text("1.000.000", style: TextStyle(fontSize: 18, color: Colors.orange),),
              Padding(
                padding: EdgeInsets.symmetric(
                  vertical: 0,
                  horizontal: 6.0,
                ),
              ),
              Text("Vnd", style: TextStyle(fontSize: 18, color: Colors.orange),)
            ])
        ),
        Padding(
          padding: EdgeInsets.symmetric(
            vertical: 0,
            horizontal: 46.0,
          ),
        ),
      ]),
      Container(
        margin: const EdgeInsets.only(top: 5),
        color: Colors.black,
        width: MediaQuery.of(context).size.width,
        height: 1,
      ),
      Padding(
        padding: EdgeInsets.symmetric(
          vertical: 6.0,
          horizontal: 0,
        ),
      ),
      Row(mainAxisAlignment: MainAxisAlignment.start, children: <Widget>[
        Text("Số dư:", style: TextStyle(fontSize: 18, color: Colors.orange),),
        Padding(
          padding: EdgeInsets.symmetric(
            vertical: 0,
            horizontal: 6.0,
          ),
        ),
        Expanded(
            child: Row(mainAxisAlignment: MainAxisAlignment.end, children: <Widget>[
              Text("1.000.000", style: TextStyle(fontSize: 18, color: Colors.orange),),
              Padding(
                padding: EdgeInsets.symmetric(
                  vertical: 0,
                  horizontal: 6.0,
                ),
              ),
              Text("Vnd", style: TextStyle(fontSize: 18, color: Colors.orange),)
            ])
        ),
        Padding(
          padding: EdgeInsets.symmetric(
            vertical: 0,
            horizontal: 46.0,
          ),
        ),
      ]),
      Container(
        margin: const EdgeInsets.only(top: 5),
        color: Colors.black,
        width: MediaQuery.of(context).size.width,
        height: 1,
      ),
    ]);
  }
}