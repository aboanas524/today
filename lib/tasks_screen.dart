import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:today/database/Database.dart';
import 'package:today/widgets/tasks_list.dart';
import 'Tasks/Add_Tasks.dart';
import 'package:today/widgets/tasks_list.dart';
class TasksScreen extends StatefulWidget {
  @override
  _TasksScreenState createState() => _TasksScreenState();
}
class _TasksScreenState extends State<TasksScreen> {
  @override
  Widget build(BuildContext context) {
    return  Scaffold(
        backgroundColor: Colors.lightBlueAccent,
        floatingActionButton: FloatingActionButton(
          backgroundColor: Colors.lightBlueAccent,
          child: Icon(Icons.add),
          onPressed: () {
            showModalBottomSheet(
              context: context,
              builder: (context) => AddTasksScreen(),
            );
          },
        ),
        body: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Container(
              padding: EdgeInsets.only(
                  top: 60, bottom: 30, right: 30, left: 30),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  CircleAvatar(
                    radius: 30,
                    backgroundColor: Colors.white,
                    child: Icon(
                      Icons.list, color: Colors.lightBlueAccent, size: 30,),
                  ),
                  SizedBox(
                    height: 15,
                  ),
                  Text('Today ', style: TextStyle(fontSize: 40,
                      fontWeight: FontWeight.w700,
                      color: Colors.white)),
                ],
              ),
            ),
            SizedBox(
              height: 10,
            ),
            Expanded(
              child: Container(
                padding: EdgeInsets.symmetric(horizontal: 20),
                decoration: BoxDecoration(
                  color: Colors.white,
                  borderRadius: BorderRadius.only(
                      topRight: Radius.circular(20),
                      topLeft: Radius.circular(20)),
                ),
                child:TaskList(),
              ),
            ),
          ],
        )
    );
  }
}



