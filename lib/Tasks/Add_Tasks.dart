import 'dart:ui';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:today/database/Database.dart';
import 'package:intl/intl.dart';
//import 'package:today/widgets/tasks_list.dart';

import '../tasks_screen.dart';

// ignore: must_be_immutable
class AddTasksScreen extends StatefulWidget {
  @override
  _AddTasksScreenState createState() => _AddTasksScreenState();
}

class _AddTasksScreenState extends State<AddTasksScreen> {
  final GlobalKey<FormState> formKey = GlobalKey<FormState>();
  var titleController = TextEditingController();
  var timeController = TextEditingController();
  var dateController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Form(
      key: formKey,
      child: Container(
        color: Color(0xff757575),
        child: Container(
          padding: EdgeInsets.all(20),
          decoration: BoxDecoration(
            color: Colors.white,
            borderRadius: BorderRadius.only(
              topRight: Radius.circular(20),
              topLeft: Radius.circular(20),
            ),
          ),
          child: Column(
            children: [
              Text(
                'Add Task',
                textAlign: TextAlign.center,
                style: TextStyle(
                    fontSize: 30,
                    color: Colors.lightBlueAccent,
                    fontWeight: FontWeight.w700),
              ),
              SizedBox(
                height: 10,
              ),
              TextFormField(
                textInputAction: TextInputAction.done,
                autofocus: true,
                controller: titleController,
                validator: (val) {
                  if (val.isEmpty)
                    return 'title must not be Empty';
                  else
                    return null;
                },
                textAlign: TextAlign.start,
                decoration: InputDecoration(
                  prefixIcon: Icon(Icons.title),
                  border: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(15)),
                ),
              ),
              SizedBox(
                height: 15,
              ),
              TextFormField(
                controller: timeController,
                validator: (val) {
                  if (val.isEmpty)
                    return 'time must not be Empty';
                  else
                    return null;
                },
                textAlign: TextAlign.start,
                decoration: InputDecoration(
                  prefixIcon: Icon(Icons.access_time),
                  border: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(15)),
                ),
                keyboardType: TextInputType.datetime,
                onTap: () {
                  showTimePicker(
                    context: context,
                    initialTime: TimeOfDay.now(),
                  ).then((value) {
                    timeController.text = value.format(context).toString();
                  });
                },
              ),
              SizedBox(
                height: 15,
              ),
              TextFormField(
                controller: dateController,
                validator: (val) {
                  if (val.isEmpty)
                    return 'date must not be Empty';
                  else
                    return null;
                },
                textAlign: TextAlign.start,
                decoration: InputDecoration(
                  prefixIcon: Icon(Icons.calendar_today),
                  border: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(15)),
                ),
                keyboardType: TextInputType.datetime,
                onTap: () {
                  showDatePicker(
                    context: context,
                    initialDate: DateTime.now(),
                    firstDate: DateTime.now(),
                    lastDate: DateTime.parse('2022-12-01'),
                  ).then((value) {
                    dateController.text = DateFormat.yMd().format(value);
                  });
                },
              ),
              SizedBox(
                height: 15,
              ),
              MaterialButton(
                height: 50,
                minWidth: 200,
                elevation: 16,
                shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(50)),
                color: Colors.lightBlueAccent,
                child: Text(
                  ' Add ',
                  style: TextStyle(fontSize: 20, color: Colors.white),
                ),
                onPressed: () {
                  if (formKey.currentState.validate() == true) {
                    final database =
                        Provider.of<AppDatabase>(context, listen: false);
                    final task = Task(
                      title: titleController.text,
                      date: dateController.text,
                      time: timeController.text,
                    );
                    //date:DateTime.parse(dateController.text).toLocal());
                    setState(() {
                      database.insertTask(task);
                    });
                    Navigator.push(
                      context,
                      MaterialPageRoute(builder: (context) => TasksScreen()),
                    );
                  }
                },
              ),
            ],
          ),
        ),
      ),
    );
  }
}
//time:DateTime.parse(timeController.text),