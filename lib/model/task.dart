import 'package:flutter/material.dart';

class Task {
  String title;
  String content;
  bool completed;

  Task({@required this.title, @required this.content, this.completed = false});

  void toggleCompleted() {
    completed = !completed;
  }
}
