import 'package:flutter/material.dart';

import 'package:flutter/src/material/checkbox.dart';
import 'package:flutter_slidable/flutter_slidable.dart';



class todoTiles extends StatelessWidget {
  final bool? taskCompleted;
  final Function(bool?)? onChanged;
  final String taskname;
  final Function(BuildContext)? deleteFunction;
  //final Callback deleteFunction;
  todoTiles({
    super.key,
    required this.taskCompleted,
    required this.onChanged,
    required this.taskname,
     required this.deleteFunction
  });
@override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.only(top: 25, left: 25, right: 25, ),
      child:  Slidable(
            endActionPane: ActionPane(
                // A motion is a widget used to control how the pane animates.
                motion: StretchMotion(),

                // All actions are defined in the children parameter.
                children: [
                  // A SlidableAction can have an icon and/or a label.
                  SlidableAction(
                     onPressed:deleteFunction,
                    backgroundColor: Color.fromARGB(255, 157, 17, 7),
                    foregroundColor: Colors.white,
                    borderRadius: BorderRadius.circular(12),
                    icon: Icons.delete,
                    label: 'Delete',
                  ),
            
          ],
        ),
        
        child: Container(
            decoration: BoxDecoration(
                color: Colors.yellow, borderRadius: BorderRadius.circular(12)),
            child: Padding(
              padding: const EdgeInsets.all(24.0),
              child: Row(
                children: [
                  Checkbox(
                    value: taskCompleted,
                    onChanged: onChanged,
                    activeColor: Colors.black,
                  ),
                  Text(
                    taskname,
                    //for line through
                    style: TextStyle(
                        decoration: taskCompleted!
                            ? TextDecoration.lineThrough
                            : TextDecoration.none),
                  ),
                ],
              ),
            )),
      ),
    );
  }
}
//row
//padding
//taskname
//value
