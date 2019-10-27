import 'package:flutter/material.dart';

class AboutScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(title: Text('About')),
        body: Container(
          alignment: Alignment(0, 0),
          child: Text('TODO Demo App by Lang Qin'),
        ));
  }
}
