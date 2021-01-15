import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';
import 'package:intl/intl.dart';
import '../models/categoriesModel.dart';
import 'detail.dart';
import '../blocs/category_bloc.dart';

final CategoryBloc categoryBloc = CategoryBloc();
Widget noTodoMessageWidget() {
  return Container(
    child: Text(
      "Chưa tạo bản ghi...",
      style: TextStyle(fontSize: 19, fontWeight: FontWeight.w500),
    ),
  );
}

Widget loadingData() {
  categoryBloc.getTodos();
  return Container(
    child: Center(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: <Widget>[
          CircularProgressIndicator(),
          Text("Loading...",
              style: TextStyle(fontSize: 19, fontWeight: FontWeight.w500))
        ],
      ),
    ),
  );
}

Widget CategoriesList(AsyncSnapshot<List<Category>> snapshot) {
  final DismissDirection _dismissDirection = DismissDirection.horizontal;
  if (snapshot.hasData) {
    if (snapshot.data.length != 0) {
      return Container(height: 500,
          child:ListView.builder(
              itemCount: snapshot.data.length,
              itemBuilder: (context, itemPosition) {
                Category category = snapshot.data[itemPosition];
                return Dismissible(
                    background: Container(
                      child: Padding(
                        padding: EdgeInsets.only(left: 10),
                        child: Align(
                          alignment: Alignment.centerLeft,
                          child: Text(
                            "Deleting",
                            style: TextStyle(color: Colors.white),
                          ),
                        ),
                      ),
                      color: Colors.redAccent,
                    ),
                    onDismissed: (direction) {
                      /*The magic
                    delete Todo item by ID whenever
                    the card is dismissed
                    */
                      categoryBloc.deleteTodoById(category.id);
                    },
                    direction: _dismissDirection,
//                    key: new ObjectKey(category),
                    key: UniqueKey(),
                    child: InkWell(
                    onTap: () {
                      Navigator.push(
                        context,
                        MaterialPageRoute(builder: (context) => Detail(),
                          settings: RouteSettings(
                            arguments: category,
                          ),),
                      );
                    },
                    child: Card(
                        shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(10)),
                        color: (itemPosition) % 2 == 0 ? Colors.grey[200] : Colors.grey[300],
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
                                  snapshot.data[itemPosition].content,
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
                                      child: Text('${snapshot.data[itemPosition].amount} Vnd',
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
                        )
                    )
                ));
              })
      );
    }
    else {
      return Container(
        child: Center(
        //this is used whenever there 0 Todo
        //in the data base
          child: noTodoMessageWidget(),
        ));
    }
  }
  else {
    return Center(
      child: loadingData(),
    );
  }
}
