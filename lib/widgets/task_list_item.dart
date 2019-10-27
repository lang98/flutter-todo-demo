import 'package:flutter/material.dart';
import 'package:flutter_todo_app/model/task.dart';
import 'package:flutter_todo_app/providers/todos_model.dart';
import 'package:flutter_todo_app/screens/task_detail_screen.dart';
import 'package:provider/provider.dart' show Provider;

class TaskListItem extends StatelessWidget {
  final Task task;

  TaskListItem({@required this.task});

  @override
  Widget build(BuildContext context) {
    return Card(
      child: ListTile(
        onTap: () {
          Navigator.push(
            context,
            MaterialPageRoute(
              builder: (context) => TaskDetailScreen(
                task: task,
              ),
            ),
          );
        },
        leading: Theme(
            data: ThemeData(unselectedWidgetColor: Colors.grey),
            child: Checkbox(
              activeColor: Colors.orange,
              value: task.completed,
              onChanged: (bool checked) {
                Provider.of<TodosModel>(context, listen: false)
                    .toggleTodo(task);
              },
            )),
        title: Text(
          task.title,
          style: TextStyle(color: Colors.black87),
        ),
        subtitle: Text(
          task.content,
          style: TextStyle(color: Colors.black38),
        ),
        trailing: IconButton(
          icon: Icon(
            Icons.clear,
            color: Colors.grey,
          ),
          onPressed: () {
            Provider.of<TodosModel>(context, listen: false).deleteTodo(task);
          },
        ),
        contentPadding: EdgeInsets.symmetric(horizontal: 16, vertical: 8),
      ),
      color: Colors.white,
    );
  }
}
