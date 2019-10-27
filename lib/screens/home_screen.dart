import 'package:flutter/material.dart';
import 'package:flutter_todo_app/screens/about_screen.dart';
import 'package:flutter_todo_app/screens/task_detail_screen.dart';
import 'package:flutter_todo_app/tabs/all_tasks.dart';
import 'package:flutter_todo_app/tabs/complete_tasks.dart';
import 'package:flutter_todo_app/tabs/incomplete_tasks.dart';

class HomeScreen extends StatefulWidget {
  @override
  _HomeScreenState createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen>
    with SingleTickerProviderStateMixin {
  int _currentIndex = 0;
  final List<Widget> _children = [
    AllTasksTab(),
    IncompleteTasksTab(),
    CompleteTasksTab()
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Todos'),
        actions: <Widget>[
          PopupMenuButton<int>(
            icon: Icon(Icons.more_vert),
            itemBuilder: (context) =>
                [PopupMenuItem(value: 1, child: Text("About App"))],
            onSelected: (value) {
              switch (value) {
                case 1:
                  Navigator.push(
                    context,
                    MaterialPageRoute(
                      builder: (context) => AboutScreen(),
                    ),
                  );
                  break;
                default:
              }
            },
          )
        ],
        backgroundColor: Colors.orange,
      ),
      body: _children[_currentIndex],
      floatingActionButton: FloatingActionButton(
        child: Icon(Icons.add),
        backgroundColor: Colors.green,
        onPressed: () {
          Navigator.push(
            context,
            MaterialPageRoute(
              builder: (context) => TaskDetailScreen(),
            ),
          );
        },
      ),
      bottomNavigationBar: BottomNavigationBar(
        items: [
          BottomNavigationBarItem(icon: Icon(Icons.apps), title: Text('All')),
          BottomNavigationBarItem(
              icon: Icon(Icons.delete), title: Text('Incomplete')),
          BottomNavigationBarItem(
              icon: Icon(Icons.favorite), title: Text('Complete'))
        ],
        currentIndex: _currentIndex,
        onTap: onTabTapped,
        backgroundColor: Colors.white,
        selectedItemColor: Colors.orange,
        unselectedItemColor: Colors.grey,
      ),
      backgroundColor: Colors.white,
    );
  }

  void onTabTapped(int index) {
    setState(() {
      _currentIndex = index;
    });
  }
}
