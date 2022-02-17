import 'package:flutter/material.dart';
import 'package:today/database/Database.dart';
class TaskList extends StatefulWidget {
  @override
  _TaskListState createState() => _TaskListState();
}
class _TaskListState extends State<TaskList> {
  @override
  Widget build(BuildContext context) {
    return FutureBuilder(
      future:  AppDatabase().getAllTasks(),
      builder: (context, AsyncSnapshot<List<Task>> snapshot) {
        // if(snapshot.connectionState==ConnectionState.waiting)return Column(mainAxisAlignment: MainAxisAlignment.center,children:[ CircularProgressIndicator(),SizedBox(height: 10,),Text('Loading...',style: TextStyle(color: Colors.blue),)]);
        // else {
          return ListView.builder(
            itemBuilder: (_, index) {
              return ListTile(
                  leading: InputChip(
                    selected: snapshot.data[index].status,
                    backgroundColor: Colors.red,
                    selectedColor: Colors.green,
                    label: Text(snapshot.data[index].status?'done':'not done'),
                    onSelected: (newValue) {
                      check( newValue,snapshot.data[index]);
                    },
                  ),
                  title: Text(snapshot.data[index].title),
                  subtitle: Text(" ${snapshot.data[index]
                      .date}       ${snapshot.data[index].time}"),
                  trailing: IconButton(
                    icon: Icon(Icons.delete_outline),
                    onPressed: () {
                      setState(() {
                        AppDatabase().deleteTask(snapshot.data[index]);
                      });
                    },
                    color: Colors.red,
                  ),);

            },
            itemCount: snapshot.data?.length ?? 0,
          );
        }
      // },
    );
  }
  void check(bool newValue,var snapshot)
  {
    setState(() {
      AppDatabase().updateTask(
          snapshot.copyWith(
              status: newValue));
    });
  }
}

