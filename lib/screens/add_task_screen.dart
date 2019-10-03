import 'package:flutter/material.dart';
import 'package:flutter_todo_app/model/task.dart';
import 'package:flutter_todo_app/providers/todos_model.dart';
import 'package:provider/provider.dart';

class AddTaskScreen extends StatefulWidget {
  @override
  _AddTaskScreenState createState() => _AddTaskScreenState();
}

class _AddTaskScreenState extends State<AddTaskScreen> {
  final _taskTitleController = TextEditingController();
  final _taskContentController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        backgroundColor: Colors.white,
        appBar: AppBar(
          title: Text('Add Task'),
          backgroundColor: Colors.green,
          actions: <Widget>[
            FlatButton(
              child: Text(
                'SAVE',
                style: TextStyle(color: Colors.white),
              ),
              onPressed: onSave,
            )
          ],
        ),
        body: Container(
            padding: EdgeInsets.all(32),
            child: Column(
              children: <Widget>[
                TextFormField(
                  controller: _taskTitleController,
                  decoration: InputDecoration(hintText: 'Title'),
                  keyboardType: TextInputType.multiline,
                ),
                TextField(
                  controller: _taskContentController,
                  decoration: InputDecoration(hintText: 'Content'),
                  keyboardType: TextInputType.multiline,
                  maxLines: null,
                  minLines: 3,
                ),
              ],
            )));
  }

  void onSave() {
    final Task todo = Task(
        title: _taskTitleController.text, content: _taskContentController.text);
    Provider.of<TodosModel>(context, listen: false).addTodo(todo);
    Navigator.pop(context);
  }
}
