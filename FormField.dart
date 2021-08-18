import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:project1_login/Refactors/Constants.dart';

class Entries extends StatelessWidget {
  final String category;
  final IconData icon;
  final TextEditingController text;

  Entries({required this.category, required this.icon,required this.text});

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.fromLTRB(12, 0, 12, 10),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: Text(
              category,
              style: TextStyle(
                  fontSize: 25),
            ),
          ),
          TextField(
            textCapitalization: TextCapitalization.words,
            controller:  text,
            decoration: InputDecoration(
              hintText: "Type in the $category ",
              prefixIcon: Icon(icon),
            ),
          ),
        ],
      ),
    );
  }
}
