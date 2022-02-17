//
// import 'package:flutter/foundation.dart';
// import 'package:today/database/Database.dart';
// import 'package:flutter/material.dart';
//
//
// class TaskData extends ChangeNotifier{
//   List<Task> tasks;
//   int get taskCount
//   {
//     return tasks?.length??0;
//   }
//   getTasks ()async
//   {
//       tasks = (await AppDatabase().getAllTasks()).cast<Task>();
//       return tasks;
//   }
//   void addTask(String title,String time,String date)async
//   {
//     Task task = Task(title: title,time:DateTime.parse(time),date:DateTime.parse(date));
//     tasks.add(task);
//     await AppDatabase().insertTask(task).then((value) => print('inserted'));
//     notifyListeners();
//
//   }
//   void updateTask(Task task)
//   {
//     notifyListeners();
//   }
//   void deleteTask(Task task)
//   {
//     tasks.remove(task);
//     notifyListeners();
//   }
//
// }
