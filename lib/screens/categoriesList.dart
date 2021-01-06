import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';
import 'package:intl/intl.dart';
import '../models/categoriesModel.dart';
import 'detail.dart';

class CategoriesList extends StatelessWidget {
  final List<Category> categories;

  CategoriesList({this.categories});
  ListView _buildListView() {
    return ListView.builder(
      itemCount: categories.length,
      itemBuilder: (context, index) {
      return InkWell(
        onTap: () {
          Navigator.push(
            context,
            MaterialPageRoute(builder: (context) => Detail()),
          );
        },
        child: Card(
        shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(10)),
        color: (index) % 2 == 0 ? Colors.grey[200] : Colors.grey[300],
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
                categories[index].content,
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
            Expanded(
              child: Row(
                mainAxisAlignment: MainAxisAlignment.end,
                children: <Widget>[
                Container(
                  padding: const EdgeInsets.all(10.0),
                  child: Text('${categories[index].amount} Vnd',
                      style:
                          TextStyle(fontSize: 18, color: Colors.orange)),
                  decoration: BoxDecoration(
                      border: Border.all(
                          color: Colors.grey,
                          width: 2,
                          style: BorderStyle.solid),
                      borderRadius:
                          BorderRadius.all(Radius.circular(10))),
                ),
                Padding(
                  padding: EdgeInsets.only(right: 10),
                )
                ],
              ))
            ],
          ))
        );
      });
  }
  @override
  Widget build(BuildContext context) {
    //Now how to make this "Scrollable", let use ListView:
    //1.ListView(children: <Widget>[]) => this loads all children at the same time
    //2.ListView(itemBuilder: ...) => this loads only visible items
    return Container(height: 500, child: _buildListView());
  }
}
