import 'dart:html';

import 'package:flutter/material.dart';
import 'package:flutter/painting.dart';
import 'package:flutter/widgets.dart';
import 'package:todo_app/Screens/add_task_screen.dart';
import 'package:todo_app/Screens/add_task_screen.dart';

class TodoListScreen extends StatefulWidget {
  const TodoListScreen({Key? key}) : super(key: key);

  @override
  _TodoListScreenState createState() => _TodoListScreenState();
}

class _TodoListScreenState extends State<TodoListScreen> {
  Widget _buildTask(index) {
    return Padding(
        padding: EdgeInsets.symmetric(horizontal: 25.0),
        child: Column(
          children: [
            ListTile(
              title: Text('Task Title'),
              subtitle: Text('Oct 2nd 2019 - High'),
              trailing: Checkbox(
                onChanged: (value) {
                  print(value);
                },
                activeColor: Theme.of(context).primaryColor,
                value: true,
              ),
            ),
            Divider()
          ],
        ));
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        floatingActionButton: FloatingActionButton(
          child: Icon(Icons.add),
          onPressed: () => Navigator.push(
            context,
            MaterialPageRoute(
              builder: (_) => AddTaskScreen(),
            ),
          ),
          backgroundColor: Theme.of(context).primaryColor,
        ),
        body: ListView.builder(
            padding: EdgeInsets.symmetric(vertical: 80.0),
            itemCount: 10,
            itemBuilder: (BuildContext context, int index) {
              if (index == 0) {
                return Padding(
                  padding:
                      EdgeInsets.symmetric(horizontal: 40.0, vertical: 20.0),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: <Widget>[
                      Text(
                        'My Tasks',
                        style: TextStyle(
                          color: Colors.black,
                          fontSize: 40.0,
                        ),
                      ),
                      SizedBox(height: 10.0),
                      Text(
                        '1 of 10',
                        style: TextStyle(
                          color: Colors.grey,
                          fontSize: 20.0,
                          fontWeight: FontWeight.w600,
                        ),
                      ),
                    ],
                  ),
                );
              }
              return _buildTask(index);
            }));
  }
}
