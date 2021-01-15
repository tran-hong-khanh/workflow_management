import 'dart:async';
import 'database.dart';
import '../models/categoriesModel.dart';

class CategoryDao {
  final dbProvider = DatabaseProvider.dbProvider;

  //Adds new Todo records
  Future<int> createTodo(Category category) async {
    final db = await dbProvider.database;
    var result = db.insert(categoryTABLE, category.toDatabaseJson());
    return result;
  }

  //Get All Todo items
  //Searches if query string was passed
  Future<List<Category>> getTodos({List<String> columns, String query}) async {
    final db = await dbProvider.database;

    List<Map<String, dynamic>> result;
    if (query != null) {
      if (query.isNotEmpty)
        result = await db.query(categoryTABLE,
            columns: columns,
            where: 'description LIKE ?',
            whereArgs: ["%$query%"]);
    } else {
      result = await db.query(categoryTABLE, columns: columns);
    }

    List<Category> categories = result.isNotEmpty
        ? result.map((item) => Category.fromDatabaseJson(item)).toList()
        : [];
    print(categories);
    return categories;
  }

  //Update Todo record
  Future<int> updateTodo(Category category) async {
    final db = await dbProvider.database;

    var result = await db.update(categoryTABLE, category.toDatabaseJson(),
        where: "id = ?", whereArgs: [category.id]);

    return result;
  }

  //Delete Todo records
  Future<int> deleteTodo(int id) async {
    final db = await dbProvider.database;
    var result = await db.delete(categoryTABLE, where: 'id = ?', whereArgs: [id]);

    return result;
  }

  //We are not going to use this in the demo
  Future deleteAllTodos() async {
    final db = await dbProvider.database;
    var result = await db.delete(
      categoryTABLE,
    );

    return result;
  }

  Future<List<Category>> categories() async {
    // Get a reference to the database.
    final db = await dbProvider.database;
//    final db = await database;
    // Query the table for all The Dogs.
    final List<Map<String, dynamic>> maps = await db.query(categoryTABLE);

    // Convert the List<Map<String, dynamic> into a List<Dog>.
    return List.generate(maps.length, (i){
      return Category(
        content: maps[i]['content'],
        amount: maps[i]['amount'],
        createdDate: maps[i]['createdDate'],
      );
    });
  }
}