import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';

class AddTaskScreen extends StatefulWidget {
  const AddTaskScreen({Key? key}) : super(key: key);

  @override
  _AddTaskScreenState createState() => _AddTaskScreenState();
}

class _AddTaskScreenState extends State<AddTaskScreen> {
  final _formkey = GlobalKey<FormState>();
  String _title = '';
  String _priority = '';
  DateTime _date = DateTime.now();
  TextEditingController _dateController = TextEditingController();

  _heandleDatePicker() async {
    // final DateTime date = await showDatePicker(
    // context: context,
    // initialDate: _date,
    // firstDate: DateTime(2000),
    // lastDate: DateTime(2100),
    // );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: <Widget>[
          GestureDetector(
            onTap: () => Navigator.pop(context),
            child: Icon(
              Icons.arrow_back_ios,
              size: 30.0,
              color: Theme.of(context).primaryColor,
            ),
          ),
          SizedBox(height: 20.0),
          Text(
            'Add Task',
            style: TextStyle(
              color: Colors.black,
              fontSize: 40.0,
            ),
          ),
          SizedBox(
            height: 10.0,
          ),
          Form(
              key: _formkey,
              child: Column(
                children: <Widget>[
                  Padding(
                    padding: EdgeInsets.symmetric(vertical: 20.0),
                    child: TextFormField(
                      controller: _dateContoller,
                      style: TextStyle(fontSize: 18.0),
                      onTap: _handleDatePicker,
                      decoration: InputDecoration(
                        labelText: 'Date',
                        labelStyle: TextStyle(fontSize: 18.0),
                        border: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(10.0),
                        ),
                      ),
                    ),
                  ),
                  Padding(
                    padding: EdgeInsets.symmetric(vertical: 20.0),
                    child: TextFormField(
                      style: TextStyle(fontSize: 18.0),
                      decoration: InputDecoration(
                        labelText: 'Title',
                        labelStyle: TextStyle(fontSize: 18.0),
                        border: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(10.0),
                        ),
                      ),
                      validator: (input) =>
                          input.trim().isEmpty ? 'Enter task' : null,
                      onSaved: (input) => _title = input,
                      initialValue: _title,
                    ),
                  ),
                ],
              ))
        ],
      ),
    );
  }
}
