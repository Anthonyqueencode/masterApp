import 'package:flutter/material.dart';
import 'package:masterapp/componenets/mybutton.dart';


class dialogBox extends StatelessWidget {
  final controller;
  final VoidCallback onsave;
  final VoidCallback oncancel;
 
  dialogBox(
      {super.key,
      required this.controller,
      required this.onsave,
      required this.oncancel,
       });
     // this.deleteFunction;
  //  this.controller,
  @override
  Widget build(BuildContext context) {
    return AlertDialog(
      // title: Text('Add task for today'),
      backgroundColor: Colors.yellow.shade300,
      content:
         Container(
          height: 140,
          child: Column(
            children: [
              TextField(
                controller: controller,
                // controller: controller,
                decoration: InputDecoration(
                    border: OutlineInputBorder(), hintText: 'Add new task'),
              ),
              SizedBox(
                height: 15,
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.end,
                children: [
                  myButton(
                    onTap: onsave,
                    child: Text(' save '),
                    colors: Colors.yellow,
                  ),
                  myButton(
                    onTap: oncancel,
                    child: Text('cancel'),
                    colors: Colors.yellow,
                  )
                ],
              )
            ],
          ),
        ),
      );
    
  }
}
// (context)=> deleteTask(index)