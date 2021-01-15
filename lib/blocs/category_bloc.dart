import '../models/categoriesModel.dart';
import '../repository/category_repository.dart';

import 'dart:async';

class CategoryBloc {
  //Get instance of the Repository
  final _categoryRepository = CategoryRepository();

  //Stream controller is the 'Admin' that manages
  //the state of our stream of data like adding
  //new data, change the state of the stream
  //and broadcast it to observers/subscribers
  final _categoryController = StreamController<List<Category>>.broadcast();

  get categories => _categoryController.stream;

  CategoryBloc() {
    getTodos();
  }

  getTodos({String query}) async {
    //sink is a way of adding data reactively to the stream
    //by registering a new event
    _categoryController.sink.add(await _categoryRepository.getAllTodos(query: query));
  }

  addTodo(Category category) async {
    await _categoryRepository.insertTodo(category);
    getTodos();
  }

  updateTodo(Category category) async {
    await _categoryRepository.updateTodo(category);
    getTodos();
  }

  deleteTodoById(int id) async {
    _categoryRepository.deleteTodoById(id);
    getTodos();
  }

  dispose() {
    _categoryController.close();
  }
}