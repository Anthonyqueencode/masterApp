import 'package:flutter/material.dart';
import 'package:hive_flutter/adapters.dart';
import 'package:masterapp/homePage.dart';
import 'package:hive/hive.dart';

void main() async{
//edit for hive storage
 await Hive.initFlutter();
 
 var Box = await Hive.openBox('myBox');
  runApp(MasterApp());
}
class MasterApp extends StatelessWidget{
  @override
  Widget build(BuildContext context){
  return MaterialApp(
    theme: ThemeData(primarySwatch: Colors.yellow),
    home: homePage()
  );
  }
}
