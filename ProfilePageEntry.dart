import 'package:flutter/material.dart';
import 'package:project1_login/Refactors/Constants.dart';

class ProfilePageEntry extends StatelessWidget {
  final String entryType;
  final IconData icon;
  final String subtitle;
  final String title;

  ProfilePageEntry(
      {required this.entryType,
        required this.icon,
        required this.title,
        required this.subtitle});

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.all(15),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            entryType,
            style: TextStyle(color: BUTTON_COLOR, fontSize: 28),
          ),
          ListTile(
              leading: Icon(
                icon,
                size: 35,
              ),

              tileColor: BUTTON_COLOR,
              subtitle: Text(
                subtitle,
                style: TextStyle(
                    fontSize: 12,
                    color: Colors.grey[900],
                    fontFamily: "Montserrat"),
              ),
              title: Text(
                title,
                style: TextStyle(
                  color: BACKGROUND_COLOR,
                  fontSize: 20,
                  // fontFamily: FONT
                ),
              )),
        ],
      ),
    );
  }
}
