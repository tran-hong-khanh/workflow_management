import 'package:flutter/material.dart';
import 'listAction.dart';
import 'total.dart';
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
      drawer: Drawer(
        // Add a ListView to the drawer. This ensures the user can scroll
        // through the options in the drawer if there isn't enough vertical
        // space to fit everything.
        child: ListView(
          // Important: Remove any padding from the ListView.
          padding: EdgeInsets.zero,
          children: <Widget>[
            DrawerHeader(
              child: Text('Drawer Header'),
              decoration: BoxDecoration(
                color: Colors.blue,
              ),
            ),
            ListTile(
              title: Text('Item 1'),
              onTap: () {
                Navigator.pop(context);
              },
            ),
            ListTile(
              title: Text('Item 2'),
              onTap: () {
                // Update the state of the app
                // ...
                // Then close the drawer
                Navigator.pop(context);
              },
            ),
          ],
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
