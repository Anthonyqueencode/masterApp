import'package:flutter/material.dart';


class myButton extends StatelessWidget{
  final GestureTapCallback onTap;
  final Widget child;
  final Color colors;

  const myButton({super.key,
 required this.colors,
  required this.onTap, required this.child,
  });
  @override
Widget build(BuildContext context){
  return GestureDetector(
    onTap: onTap,
    child: Container(
      padding: EdgeInsets.all(18),
      margin: EdgeInsets.symmetric(horizontal: 10),
      decoration: BoxDecoration(color:colors,  borderRadius:BorderRadius.circular(18)),
       child: Center(child: child),
        //Text('log in', style: TextStyle(color: Colors.white, fontSize: 16),)),
    ),
    // theme.of(context).primarySwatch,
  
   //()=>Navigator.pushReplacement(context, MaterialPageRoute(builder:(context)=> registerScreen())),
  );
}
}