import 'package:flutter/material.dart';
import 'package:project1_login/Refactors/Constants.dart';

import 'package:project1_login/Refactors/ProfilePageEntry.dart';

class ProfilePage extends StatefulWidget {
  final String title;
  final String email;
  final String password;
  final String image;

  ProfilePage(
      {required this.title,
      required this.email,
      required this.password,
      required this.image});

  @override
  _ProfilePageState createState() => _ProfilePageState();
}

class _ProfilePageState extends State<ProfilePage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        backgroundColor: BACKGROUND_COLOR,
        body: SafeArea(
            child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          // mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: [
            CircleAvatar(
              backgroundImage: AssetImage(widget.image.toString()),
              radius: 60,
            ),

            ProfilePageEntry(
              entryType: "Title",
              title: widget.title,
              subtitle: "Account name",
              icon: Icons.perm_identity_outlined,
            ),

            ProfilePageEntry(
                entryType: "Email",
                icon: Icons.email_outlined,
                title: widget.email,
                subtitle: "Account email"),

            ProfilePageEntry(
                entryType: "Password",
                icon: Icons.password,
                title: widget.password,
                subtitle: "Account password")

          ],
        )));
  }
}

