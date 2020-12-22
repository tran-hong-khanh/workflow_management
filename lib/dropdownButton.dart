/// Flutter code sample for DropdownButton

// This sample shows a `DropdownButton` with a large arrow icon,
// purple text style, and bold purple underline, whose value is one of "One",
// "Two", "Free", or "Four".
//
// ![](https://flutter.github.io/assets-for-api-docs/assets/material/dropdown_button.png)
import 'package:flutter/material.dart';

/// This is the stateful widget that the main application instantiates.
class Dropdown extends StatefulWidget {
  Dropdown({Key key}) : super(key: key);

  @override
  _MyStatefulWidgetState createState() => _MyStatefulWidgetState();
}

/// This is the private State class that goes with MyStatefulWidget.
class _MyStatefulWidgetState extends State<Dropdown> {
  String dropdownValue = 'Chi';

  @override
  Widget build(BuildContext context) {
    return SafeArea(
//      minimum: const EdgeInsets.only(left: 16, right: 16),
      child: Column(
          mainAxisAlignment: MainAxisAlignment.end,
          children: <Widget>[

            TextField(
              decoration: InputDecoration(labelText: "Ghi chú:"),
            ),
            TextField(
              decoration: InputDecoration(labelText: "Số tiền: (nghìn đồng)"),
            ),
            Padding(
              padding: EdgeInsets.symmetric(
                vertical: 6.0,
                horizontal: 0,
              ),
            ),
            Row(
                mainAxisAlignment: MainAxisAlignment.start,
                children: <Widget>[
                  DropdownButton<String>(
                    value: dropdownValue,
                    icon: Icon(Icons.arrow_downward),
                    iconEnabledColor: Colors.blue,
                    iconSize: 20,
                    elevation: 16,
                    style: TextStyle(color: Colors.blue, fontSize: 18),
                    underline: Container(
                      height: 2,
                      color: Colors.blue,
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
                  Expanded(
                    child: FlatButton(
                      color: Colors.blue,
                      textColor: Colors.white,
                      disabledColor: Colors.grey,
                      disabledTextColor: Colors.black,
                      padding: EdgeInsets.only(top: 10, bottom: 10),
                      splashColor: Colors.blueAccent,
                      onPressed: () {
//                        Navigator.pop(context);
                      },
                      child: Text(
                        "Xác nhận",
                        style: TextStyle(fontSize: 20.0),
                      ),
                    ),
                  )
                ]
            ),
            Padding(
              padding: EdgeInsets.symmetric(
                vertical: 6.0,
                horizontal: 0,
              ),
            ),
          ]
      ),
    );
  }
}
