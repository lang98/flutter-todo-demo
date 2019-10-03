import 'package:flutter/material.dart';
import 'package:flutter_todo_app/providers/todos_model.dart';
import 'package:flutter_todo_app/widgets/task_list.dart';
import 'package:provider/provider.dart';

class IncompleteTasksTab extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Container(
      color: Colors.black12,
      child: Consumer<TodosModel>(
        builder: (context, todos, child) => TaskList(
          tasks: todos.incompleteTasks,
        ),
      ),
    );
  }
}
