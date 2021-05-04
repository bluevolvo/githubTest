import 'package:bitcoin4real/Pages/DisplayPage.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

void main () => (runApp(First()));


class First extends StatelessWidget{
  @override
  Widget build (BuildContext context){
    return MaterialApp(
      home: Display(),

    );
  }
}