import 'package:flutter/material.dart';
import '../models/categoriesModel.dart';
import 'categoriesList.dart';

class Categories extends StatefulWidget {
  Categories({Key key}) : super(key: key);
  @override
  _CategoriesState createState() => _CategoriesState();
}

class _CategoriesState extends State<Categories> {
  final _contentController = TextEditingController();
  final _amountController = TextEditingController();
  Category _category = Category(content: '', amount: 0.0);
  List<Category> _categories = List<Category>();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          if (_category.content.isEmpty ||
              _category.amount == 0.0 ||
              _category.amount.isNaN) {
            return;
          }
          _category.createdDate = DateTime.now();
          _categories.add(_category);
          _category = Category(content: '', amount: 0.0);
          setState(() {
            _category.content = '';
            _category.amount = 0.0;
          });
          _contentController.text = '';
          _amountController.text = '';
        },
        child: Icon(Icons.add),
        backgroundColor: Colors.orange,
      ),
      appBar: AppBar(
        title: Text("Thêm bản ghi"),
        backgroundColor: Colors.orange,
      ),
      body: SafeArea(
          minimum:
              const EdgeInsets.only(left: 20, right: 20, top: 10, bottom: 10),
          child: SingleChildScrollView(
            child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: <Widget>[
                  Padding(
                    padding: EdgeInsets.symmetric(
                      vertical: 6.0,
                      horizontal: 0,
                    ),
                  ),
                  TextField(
                      decoration: InputDecoration(labelText: "Tiêu đề:"),
                      controller: _contentController,
                      onChanged: (text) {
                        setState(() {
                          _category.content = text;
                        });
                      }),
                  TextField(
                      decoration:
                          InputDecoration(labelText: "Số tiền dự toán: (đồng)"),
                      controller: _amountController,
                      keyboardType: TextInputType.number,
                      onChanged: (text) {
                        setState(() {
                          _category.amount = double.tryParse(text) ?? 0;
                        });
                      }),
                  Padding(
                    padding: EdgeInsets.symmetric(
                      vertical: 10.0,
                      horizontal: 0,
                    ),
                  ),
                  Padding(
                    padding: EdgeInsets.symmetric(
                      vertical: 5.0,
                      horizontal: 0,
                    ),
                  ),
                  CategoriesList(categories: _categories)
                ]),
          )),
    );
  }
}
