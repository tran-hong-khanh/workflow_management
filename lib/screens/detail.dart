import 'package:flutter/material.dart';
import 'listAction.dart';
import 'total.dart';
import 'categories.dart';
import 'categoryDrawer.dart';
import '../blocs/category_bloc.dart';
import '../models/categoriesModel.dart';
import '../resources/category_dao.dart';
import 'dart:developer';

class Detail extends StatefulWidget {
  Detail({Key key}) : super(key: key);
  @override
  _MyStatefulWidgetState createState() => _MyStatefulWidgetState();
}
class _MyStatefulWidgetState extends State<Detail> {
  final CategoryBloc categoryBloc = CategoryBloc();
  final categoryDao = CategoryDao();
  Future<List<Category>> listCategories;
  String dropdownValue = 'Chi';
  String _content = "";
  double _amount = 0;
  final _contentController = TextEditingController();
  final _amountController = TextEditingController();

  void initState() {
    super.initState();
    listCategories = categoryDao.categories();
  }

  Widget getCategoriesWidget(){
    final DismissDirection _dismissDirection = DismissDirection.horizontal;
    return FutureBuilder<List<Category>>(
      future: listCategories,
      builder: (context, snapshot) {
        if (snapshot.hasData) {
          print("snapshot.hasData");
          return Container(height: 300,
              child: ListView.builder(
              itemCount: snapshot.data.length,
              itemBuilder: (context, index) {
                Category category = snapshot.data[index];
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
                          Navigator.push(
                            context,
                            MaterialPageRoute(builder: (context) => Categories()),
                          );
                          },
                          direction: _dismissDirection,
                         key: new ObjectKey(category),
//                           key: UniqueKey(),
                    child: CategoryDrawer(context, snapshot.data[index]));
                })
          );
        } else if (snapshot.hasError) {
          return Text("${snapshot.error}");
        }

        // By default, show a loading spinner.
        return CircularProgressIndicator();
      },
    );
  }

  @override
  Widget build(BuildContext context) {
    final Category category = ModalRoute.of(context).settings.arguments;
    return Scaffold(
      appBar: AppBar(
        title: const Text('Thêm chi tiêu'),
        backgroundColor: Colors.orange,
        actions: <Widget>[
          IconButton(
            icon: const Icon(Icons.article, size: 30),
            tooltip: 'Show Snackbar',
            onPressed: () {
              Navigator.push(
                  context,
                  MaterialPageRoute(builder: (context) => ListAction()),
              );
            },
          ),
        ],
      ),
      drawer: Container(
        width: 250,
        child: Drawer(
          child: ListView(
          // Important: Remove any padding from the ListView.
          padding: EdgeInsets.zero,
          children: <Widget>[
            DrawerHeader(
              child: Column(
                mainAxisAlignment: MainAxisAlignment.start, children: <Widget>[
                Row(
                mainAxisAlignment: MainAxisAlignment.start, children: <Widget>[
                  IconButton(
                    icon: const Icon(Icons.article, size: 70, color: Colors.white),
                    tooltip: 'Show Snackbar',
                  ),
                  Padding(
                    padding: EdgeInsets.symmetric(
                      vertical: 0,
                      horizontal: 25,
                    ),
                  ),
                  Column(
                      mainAxisAlignment: MainAxisAlignment.center, children: <Widget>[
                    Padding(
                      padding: EdgeInsets.symmetric(
                        vertical: 15,
                        horizontal: 0,
                      ),
                    ),
                    Text('Categories', style: TextStyle(fontSize: 20, color: Colors.white)),
                    Padding(
                      padding: EdgeInsets.symmetric(
                        vertical: 10,
                        horizontal: 0,
                      ),
                    ),
                    Container(
                      height: 30,
                      child: OutlineButton(
                        child: Icon(Icons.add, size: 30, color: Colors.white),
                        onPressed: () {
                          Navigator.push(
                            context,
                            MaterialPageRoute(builder: (context) => Categories()),
                          );
                        },
                          borderSide: BorderSide(color: Colors.white)
                      ))
                  ]),
                ]
                )
              ]),
              decoration: BoxDecoration(
                color: Colors.orange,
              ),
            ),
            getCategoriesWidget()
            ],
          ),
        ),
      ),
      body: SafeArea(
        minimum: const EdgeInsets.only(left: 20, right: 20, top: 10, bottom: 10),
        child:
        Container(
          margin: const EdgeInsets.only(top: 20),
//          color: Colors.black,
          width: MediaQuery.of(context).size.width,
          height: MediaQuery.of(context).size.height,
          child: SingleChildScrollView(
            child: Column(mainAxisAlignment: MainAxisAlignment.center, children: <Widget>[
              Column(mainAxisAlignment: MainAxisAlignment.center, children: <Widget>[
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
                        Text(category.amount.toString(), style: TextStyle(fontSize: 18, color: Colors.orange),),
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
              ]),
              Padding(
                padding: EdgeInsets.symmetric(
                  vertical: 26.0,
                  horizontal: 0,
                ),
              ),
              TextField(
                  decoration: InputDecoration(labelText: "Ghi chú:"),
                  controller: _contentController,
                  onChanged: (text) {
                    setState(() {
                      _content = text;
                    });
                  }),
              TextField(
                  decoration: InputDecoration(labelText: "Số tiền: (đồng)"),
                  controller: _amountController,
                  keyboardType: TextInputType.number,
                  onChanged: (text) {
                    setState(() {
                      _amount = double.parse(text) ?? 0;
                    });
                  }),
              Padding(
                padding: EdgeInsets.symmetric(
                  vertical: 6.0,
                  horizontal: 0,
                ),
              ),
              Row(mainAxisAlignment: MainAxisAlignment.start, children: <Widget>[
                DropdownButton<String>(
                  value: dropdownValue,
                  icon: Icon(Icons.arrow_downward),
                  iconEnabledColor: Colors.orange,
                  iconSize: 20,
                  elevation: 16,
                  style: TextStyle(color: Colors.orange, fontSize: 16),
                  underline: Container(
                    height: 2,
                    color: Colors.orange,
                  ),
                  onChanged: (String newValue) {
                    setState(() {
                      dropdownValue = newValue;
                    });
                  },
                  items: <String>['Chi', 'Thu']
                      .map<DropdownMenuItem<String>>((String value) {
                    return DropdownMenuItem<String>(
                      value: value,
                      child: Text(value),
                    );
                  }).toList(),
                ),
                Padding(
                  padding: EdgeInsets.symmetric(
                    vertical: 0,
                    horizontal: 6.0,
                  ),
                ),
              ]),
              Padding(
                padding: EdgeInsets.symmetric(
                  vertical: 6.0,
                  horizontal: 0,
                ),
              ),
            ]),
          ),
        ),

      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          print(_content);
          print(_amount);
          print(dropdownValue);
          print(category);
        },
        child: Icon(Icons.add),
        backgroundColor: Colors.orange,
      ),
    );
  }
}
