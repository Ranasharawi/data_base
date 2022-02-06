import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

Widget defaultButton({
  double width = double.infinity ,
 Color background = Colors.blue,
  double radius= 0.0,
 @required Function function,
 @required String text,

  bool isUpperCase = true


})=> Padding(
  padding: const EdgeInsets.all(20.0),
  child:
  Container(
    decoration: BoxDecoration(
        color: background ,
        borderRadius: BorderRadius.circular(radius)
    ),
       width:width,
       height: 40 ,
    child:
    MaterialButton(
      onPressed:function,

      child: Text(
        isUpperCase? text.toUpperCase():text ,
        style: TextStyle(color: Colors.white),),),
  ),
);