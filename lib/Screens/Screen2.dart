import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class Screen2 extends StatefulWidget {
  String title;

  // String image
  // String date;
  int tag;
  String image;

  Screen2({required this.title, required this.tag, required this.image});

  @override
  _Screen2State createState() => _Screen2State();
}

class _Screen2State extends State<Screen2> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color(0XFF333333),
      appBar: AppBar(
        brightness: Brightness.light,
        leading: IconButton(
          icon: Icon(
            Icons.arrow_back_ios_new_rounded,
            size: 30,
            color: Color(0xFF643173),
          ),
          onPressed: () {
            Navigator.pop(context);
          },
        ),
        elevation: 0,
        backgroundColor: Color(0XFF333333),
      ),
      body:
        ListView(
          children: [
            Align(
                alignment: Alignment.topCenter,
                child: Text(
                  widget.title,
                  style: TextStyle(
                      fontSize: 20,
                      fontWeight: FontWeight.w700,
                      color: Colors.white),
                )),
            Hero(
                tag: "dash${widget.tag - 1}",
                child: Container(

                    margin: EdgeInsets.all(20),
                    child: ClipRRect(
                      child: Image.network(widget.image),
                      borderRadius: BorderRadius.all(Radius.circular(10)),
                    ))),
          ],
        ),

    );
  }
}
