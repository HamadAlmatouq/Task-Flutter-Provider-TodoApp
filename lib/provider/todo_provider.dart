import 'package:flutter/material.dart';
import 'package:todo_app/models/todo.dart';

class TodoProvider extends ChangeNotifier {
  List<Todo> todos = [
    Todo(id: 1, title: "First todo"),
  ];

  void addTodo({required String title}) {
    var newTodo = Todo(
      id: todos.isNotEmpty ? todos.last.id + 1 : 1,
      title: title,
    );
    todos.add(newTodo);
    notifyListeners();
  }

  void toggleTodoStatus(int id) {
    final todo = todos.firstWhere((todo) => todo.id == id);
    //Toggle the done status
    todo.done = !todo.done;
    //Notify listeners to update UI
    notifyListeners();
  }
}
