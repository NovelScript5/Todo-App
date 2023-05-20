import 'package:flutter/material.dart';

class MyButton extends StatelessWidget {

  final function;
  final text;
  final Color color;


  const MyButton({super.key,required this.function,required this.text,required this.color});

  @override
  Widget build(BuildContext context) {
    return GestureDetector(onTap: function,child: Container(

    width: 110,height: 60,
    decoration: BoxDecoration(

    color: color,
    borderRadius: BorderRadius.circular(24)

    ),
    child: Center(child: Text(text,style: TextStyle(fontSize: 22,fontWeight: FontWeight.bold),),),

    ),);
  }
}