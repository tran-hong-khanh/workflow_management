import '../resources/category_dao.dart';
import '../models/categoriesModel.dart';

class CategoryRepository {
  final categoryDao = CategoryDao();

  Future getAllTodos({String query}) => categoryDao.getTodos(query: query);

  Future insertTodo(Category category) => categoryDao.createTodo(category);

  Future updateTodo(Category category) => categoryDao.updateTodo(category);

  Future deleteTodoById(int id) => categoryDao.deleteTodo(id);

  //We are not going to use this in the demo
  Future deleteAllTodos() => categoryDao.deleteAllTodos();
}