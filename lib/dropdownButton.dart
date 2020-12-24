import 'package:flutter/material.dart';
import 'listAction.dart';
import 'total.dart';
import 'categories.dart';
import 'categoryDrawer.dart';

class Dropdown extends StatefulWidget {
  Dropdown({Key key}) : super(key: key);
  @override
  _MyStatefulWidgetState createState() => _MyStatefulWidgetState();
}

class _MyStatefulWidgetState extends State<Dropdown> {
  String dropdownValue = 'Chi';
  String _content = "";
  double _amount = 0;
  final _contentController = TextEditingController();
  final _amountController = TextEditingController();

  @override
  Widget build(BuildContext context) {
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
            CategoryDrawer(),
            CategoryDrawer(),
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
              Total(),
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
        },
        child: Icon(Icons.add),
        backgroundColor: Colors.orange,
      ),
    );
  }
}
