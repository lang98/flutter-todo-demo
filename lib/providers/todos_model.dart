import 'dart:collection';
import 'package:flutter/foundation.dart';
import 'package:flutter_todo_app/model/task.dart';

class TodosModel extends ChangeNotifier {
  final List<Task> _tasks = [
    Task(
        title: 'Things for today',
        content:
            'A mixture between dependency injection (DI) and state management, built with widgets for widgets.'),
    Task(
        title: 'Write a blog post',
        content:
            'To expose a variable using provider, wrap any widget into one of the provider widgets from this package and pass it your variable.'),
    Task(
        title: 'Share with community',
        content:
            'Alternatively, for complex objects, most providers expose a constructor that takes a function to create the value.'),
  ];

  UnmodifiableListView<Task> get allTasks => UnmodifiableListView(_tasks);
  UnmodifiableListView<Task> get incompleteTasks =>
      UnmodifiableListView(_tasks.where((todo) => !todo.completed));
  UnmodifiableListView<Task> get completedTasks =>
      UnmodifiableListView(_tasks.where((todo) => todo.completed));

  void addTodo(Task task) {
    _tasks.add(task);
    notifyListeners();
  }

  void toggleTodo(Task task) {
    final taskIndex = _tasks.indexOf(task);
    _tasks[taskIndex].toggleCompleted();
    notifyListeners();
  }

  void deleteTodo(Task task) {
    _tasks.remove(task);
    notifyListeners();
  }
}
