import 'package:data_base/archived_tasks.dart';
import 'package:data_base/done_tasks.dart';
import 'package:data_base/new_tasks.dart';
import 'package:flutter/material.dart';
import 'package:sqflite/sqflite.dart';


class HomeLayout extends StatefulWidget {
  @override
  _HomeLayoutState createState() => _HomeLayoutState();
}

class _HomeLayoutState extends State<HomeLayout> {
  int CurrentIndex =0;
 List<Widget> screens = [
   NewTasksScreenScreen(),
   DoneTasksScreen(),
   ArchivedTasksScreen(),
 ];
 List<String> titles=[
   'New Tasks',
   'Done Tasks',
   'Archived Tasks',
 ];
 Database database;
 var scaffoldKey=GlobalKey<ScaffoldState>();
 bool isBottomSheetShown =false;
 IconData fabIcon= Icons.edit;
 @override
  void initState() {
    super.initState();
    createDatabase();
  }

  @override
  Widget build(BuildContext context)
  {

    return Scaffold(
      key: scaffoldKey,
      appBar: AppBar(
        title: Text(
          titles[CurrentIndex]
        ),
      ),
      body: screens[CurrentIndex],
      floatingActionButton: FloatingActionButton(
        onPressed: ()  {
          if(isBottomSheetShown){
            Navigator.pop(context);
            isBottomSheetShown = false;
            setState(() {
              fabIcon = Icons.edit;
            });
          } else
            {
            scaffoldKey.currentState.showBottomSheet(
                  (context) => Column(
                    children: [


                    ],
                  ),
            );
            isBottomSheetShown=true;
            setState(() {
              fabIcon=Icons.add;
            });

          }

        },
        child: Icon(fabIcon),
      ),




      bottomNavigationBar: BottomNavigationBar(
        type: BottomNavigationBarType.fixed,
        elevation: 10,
        currentIndex: CurrentIndex,
        onTap: (index){
          setState(() {
            CurrentIndex=index;
          });
        },
        items: [
          BottomNavigationBarItem(icon:  Icon(Icons.menu),
              label: '  New Tasks'),
          BottomNavigationBarItem(icon:  Icon(Icons.check),
              label: 'Done Tasks') ,
          BottomNavigationBarItem(icon:  Icon(Icons.archive_outlined),
              label: 'Archived Tasks')

        ],
      ),
    );


  }
  Future<String> getName()async
  {
    return'Rana';
  }
  void createDatabase()async{
    database =await openDatabase(
      'ToDo.db',
      version: 1,
      onCreate: (database,version){
        print('database created');
        database.execute('CREATE TABLE tasks(id INTEGER PRIMARY KEY,title TEXT,date TEXT,time TEXT,status TEXT)').then((value)
        {print('table created');
        }).catchError((error){
          print('Error When creating Table ${error.toString()}');
        });
      },
      onOpen: (database){
        print ('database opened');

      }
    );

  }
  void insertToDatabase(){
    database.transaction((txn) {
     txn.rawInsert('INSERT INTO tasks(title, date , time , status) VALUES("first task","1133","2222","new")',
     )
         .then((value) {
       print('$value inserted successfully');
     }).catchError((error){
       print('Error When Inserting New Record ${error.toString()}');
     });
     return null;
   });

  }
}

