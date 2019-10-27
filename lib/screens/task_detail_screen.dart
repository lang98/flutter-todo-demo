import 'package:flutter/material.dart';
import 'package:flutter_todo_app/model/task.dart';
import 'package:flutter_todo_app/providers/todos_model.dart';
import 'package:provider/provider.dart';

class TaskDetailScreen extends StatefulWidget {
  final Task task;

  TaskDetailScreen({this.task});

  @override
  _TaskDetailScreenState createState() => _TaskDetailScreenState();
}

class _TaskDetailScreenState extends State<TaskDetailScreen> {
  var _taskTitleController;
  var _taskContentController;

  @override
  void initState() {
    super.initState();
    _taskTitleController = TextEditingController(text: widget.task.title);
    _taskContentController = TextEditingController(text: widget.task.content);
  }

  @override
  void dispose() {
    _taskTitleController.dispose();
    _taskContentController.dispose();
    super.dispose();
  }

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
    if (widget.task == null) {
      Provider.of<TodosModel>(context, listen: false).addTodo(todo);
    } else {
      Provider.of<TodosModel>(context, listen: false)
          .editTodo(widget.task, todo);
    }
    Navigator.pop(context);
  }
}
