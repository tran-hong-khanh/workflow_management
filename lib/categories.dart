import 'package:flutter/material.dart';
import 'categoriesContent.dart';
import 'categoriesList.dart';

class Categories extends StatefulWidget {
  Categories({Key key}) : super(key: key);
  @override
  _CategoriesState createState() => _CategoriesState();
}

class _CategoriesState extends State<Categories> {
  // String _content = "";
  // double _amount = 0;
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
          _contentController.text = '';
          _amountController.text = '';
        },
        child: Icon(Icons.add),
        backgroundColor: Colors.orange,
      ),
      appBar: AppBar(
        title: Text("Quản lý bản ghi"),
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
                  Text("Thêm danh mục: ",
                      style: TextStyle(fontSize: 20, color: Colors.orange)),
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
                      vertical: 16.0,
                      horizontal: 0,
                    ),
                  ),
                  Text("Tất cả danh mục: ",
                      style: TextStyle(fontSize: 20, color: Colors.orange)),
                  CategoriesList(categories: _categories)
                ]),
          )),
    );
  }
}
