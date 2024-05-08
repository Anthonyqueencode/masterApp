import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';
import 'package:hive_flutter/hive_flutter.dart';
import 'package:masterapp/componenets/dialogBox.dart';
import 'package:masterapp/componenets/todoTiles.dart';
import 'package:masterapp/data/database.dart';

class homePage extends StatefulWidget {
  @override
  State<homePage> createState() => _homePageState();
}

class _homePageState extends State<homePage> {
final _myBox = Hive.box('myBox');
 // make a list of todo
 ToDoDatabase db = ToDoDatabase();

 @override
  void initState() {
    //if users first time create default 
    if ( _myBox.get('TODOLIST')== null) {
      db.createInitialData();
    } else {
    db.loadData();  
    }
    super.initState();
  }
 
  final _controller = TextEditingController();
 
  void onchangedTodo(bool? value, int index) {
    setState(() {
      db.todoList[index][1] = !db.todoList[index][1];
    });
   //update
    db.updateDatabase();
  }

    void deleteTask( int index){
    setState(() {
      db.todoList.removeAt(index);
    });
     db.updateDatabase();
  }
//THIS CODE MANAGES USERS INPUT, 
//IT RETRIEVES WITH CONTROLLER AND ADDS WITH ADD
  void saveNewTask() {
    setState(() {
      db.todoList.add([_controller.text, false]);
      //clears user input from textfeild
      _controller.clear();
    });
    // the .pop makes the alertbox disappear
    Navigator.of(context).pop();
     db.updateDatabase();
  }

  void createNewTask() {
    //this is responsible for what happen in the dialog box
    showDialog(
        context: context,
        builder: (context) {
          return dialogBox(
            controller: _controller,
            onsave: saveNewTask,
            oncancel: () => Navigator.of(context).pop(),
           // deleteFunction: deleteTask(index)
          );
        });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        backgroundColor: Colors.yellow.shade200,
        appBar: AppBar(
          title: Text('TO DO'),
          centerTitle: true,
          backgroundColor: Colors.yellow.shade300,
          elevation: 0,
        ),
        floatingActionButton: FloatingActionButton(
          onPressed: () => createNewTask(),
          child: Icon(Icons.add),
          backgroundColor: Colors.yellow,
        ),
        body: ListView.builder(
            itemCount: db.todoList.length,
            itemBuilder: (context, index) {
              return todoTiles(
                  taskname: db.todoList[index][0],
                  taskCompleted: db.todoList[index][1],
                  onChanged: (value) => onchangedTodo(value, index), 
                  deleteFunction: (context)=> deleteTask(index),);
          
                  
            })

        // ListView(children: [
        //   Padding(
        //     padding: const EdgeInsets.all(8.0),
        //     child: todoTiles(taskname: "CODE NOW",
        //     taskCompleted: true,
        //     onChanged: (p0 ) {  },),
        //   ),
        //    Padding(
        //      padding: const EdgeInsets.all(8.0),
        //      child: todoTiles(taskname: "COOK OKRO",
        //              taskCompleted: false,
        //              onChanged: (p0 ) {  },),
        //    ),
        //    todoTiles(taskname: "CODE NOW",
        //   taskCompleted: true,
        //   onChanged: (p0 ) {  },)
        // ],),
        );
  }
  // @override
  // void debugFillProperties(DiagnosticPropertiesBuilder properties) {
  //   super.debugFillProperties(properties);
  //   properties.add(DiagnosticsProperty<BuildContext?>('context', context));
  // }
}
