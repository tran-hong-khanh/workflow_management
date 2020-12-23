import 'package:flutter/material.dart';

class ListAction extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Thống kê"),
        backgroundColor: Colors.orange,
      ),
      body: SafeArea(
        minimum: const EdgeInsets.only(left: 20, right: 20, top: 10, bottom: 10),
        child: SingleChildScrollView(
          child: Column(mainAxisAlignment: MainAxisAlignment.center, children: <Widget>[
            Row(mainAxisAlignment: MainAxisAlignment.start, children: <Widget>[
              Text("Tổng thu:", style: TextStyle(fontSize: 16),),
              Padding(
                padding: EdgeInsets.symmetric(
                  vertical: 0,
                  horizontal: 6.0,
                ),
              ),
              Expanded(
                child: Row(mainAxisAlignment: MainAxisAlignment.end, children: <Widget>[
                    Text("1.000.000.000", style: TextStyle(fontSize: 16),),
                    Padding(
                      padding: EdgeInsets.symmetric(
                        vertical: 0,
                        horizontal: 6.0,
                      ),
                    ),
                    Text("Vnd", style: TextStyle(fontSize: 16),)
                ])
              ),
              Padding(
                padding: EdgeInsets.symmetric(
                  vertical: 0,
                  horizontal: 46.0,
                ),
              ),
            ]),
            Padding(
              padding: EdgeInsets.symmetric(
                vertical: 6.0,
                horizontal: 0,
              ),
            ),
            Row(mainAxisAlignment: MainAxisAlignment.start, children: <Widget>[
              Text("Tổng chi:", style: TextStyle(fontSize: 16),),
              Padding(
                padding: EdgeInsets.symmetric(
                  vertical: 0,
                  horizontal: 6.0,
                ),
              ),
              Expanded(
                  child: Row(mainAxisAlignment: MainAxisAlignment.end, children: <Widget>[
                    Text("1.000.000", style: TextStyle(fontSize: 16),),
                    Padding(
                      padding: EdgeInsets.symmetric(
                        vertical: 0,
                        horizontal: 6.0,
                      ),
                    ),
                    Text("Vnd", style: TextStyle(fontSize: 16),)
                  ])
              ),
              Padding(
                padding: EdgeInsets.symmetric(
                  vertical: 0,
                  horizontal: 46.0,
                ),
              ),
            ]),
            Padding(
              padding: EdgeInsets.symmetric(
                vertical: 6.0,
                horizontal: 0,
              ),
            ),
            Row(mainAxisAlignment: MainAxisAlignment.start, children: <Widget>[
              Text("Số dư:", style: TextStyle(fontSize: 16),),
              Padding(
                padding: EdgeInsets.symmetric(
                  vertical: 0,
                  horizontal: 6.0,
                ),
              ),
              Expanded(
                  child: Row(mainAxisAlignment: MainAxisAlignment.end, children: <Widget>[
                    Text("1.000.000", style: TextStyle(fontSize: 16),),
                    Padding(
                      padding: EdgeInsets.symmetric(
                        vertical: 0,
                        horizontal: 6.0,
                      ),
                    ),
                    Text("Vnd", style: TextStyle(fontSize: 16),)
                  ])
              ),
              Padding(
                padding: EdgeInsets.symmetric(
                  vertical: 0,
                  horizontal: 46.0,
                ),
              ),
            ]),
          ]),
        )
      )
    );
  }
}