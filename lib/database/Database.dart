import 'package:moor/moor.dart';
import 'package:moor_flutter/moor_flutter.dart';
part 'Database.g.dart';


class Tasks extends Table
{
  IntColumn get id => integer().autoIncrement()();
  TextColumn get title =>text().withLength(min: 1,max: 50)();
  TextColumn get date => text().withLength(min: 1,max: 50)();
  TextColumn get time => text().withLength(min: 1,max: 50)();
  BoolColumn get status => boolean().withDefault(Constant(false))();
}
@UseMoor(tables: [Tasks])
class AppDatabase extends _$AppDatabase{
  AppDatabase():super(FlutterQueryExecutor.inDatabaseFolder(
      path: 'dbd.sqlite',logStatements: true));
  @override
  int get schemaVersion => 1;

  Future<List<Task>> getAllTasks() => select(tasks).get();
  Stream<List<Task>> watchAllTasks() => select(tasks).watch();
  Future insertTask(Task task) => into(tasks).insert(task).then((value) => print('inserted')).catchError((e){print('error = '+e);});
  Future updateTask(Task task) => update(tasks).replace(task);
  Future deleteTask(Task task) => delete(tasks).delete(task);
}

//
//
// class DB{
//   static Database database;
//   // ignore: non_constant_identifier_names
//   static void CreateDB() async
//   {
//     var databasesPath = await getDatabasesPath();
//     String path = join(databasesPath, 'tasks.db');
//     database = await openDatabase(
//         path,
//         version: 1,
//         onCreate: (database, version) {
//           database.execute(
//               'CREATE TABLE tasks (id INTEGER PRIMARY KEY,title TEXT,time TEXT,date TEXT,status TEXT)')
//               .then((value) {
//             print('database created');
//           }).catchError((error) {
//             print('error when creating is ${error.toString()}');
//           });
//         },
//         onOpen: (database) {
//           print('database opened');
//         }
//        );
//   }
//   static void insertDB(
//     {@required String title,
//     @required String time,
//     @required String date,
//   })async
//   {
//      await database.transaction((txn) {
//       txn.rawInsert(
//           'INSERT INTO tasks(title,date,time,status) VALUES($title,$date,$time,false)')
//           .then((value) {
//         print('$value inserted successfully');
//       }).catchError((error) {
//         print('error when inserting new Record ${error.toString()}');
//       });
//       return null;
//     });
//   }
// }
//
