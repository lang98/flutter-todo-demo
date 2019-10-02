import 'package:flutter/material.dart';
import 'package:flutter_todo_app/providers/todos_model.dart';
import 'package:flutter_todo_app/screens/home_screen.dart';
import 'package:provider/provider.dart';

void main() => runApp(TodosApp());

class TodosApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider(
      builder: (context) => TodosModel(),
      child: MaterialApp(
        title: 'Todos',
        theme: ThemeData.dark(),
        home: HomeScreen(),
      ),
    );
  }
}
