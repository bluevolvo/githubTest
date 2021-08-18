import 'package:flutter/material.dart';
import 'package:project1_login/Refactors/Button.dart';
import 'package:project1_login/Refactors/Constants.dart';
import 'package:project1_login/Pages/SignIn.dart';

class SignUp extends StatefulWidget {
  @override
  _SignUpState createState() => _SignUpState();
}

class _SignUpState extends State<SignUp> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: BACKGROUND_COLOR,
      appBar: AppBar(
        backgroundColor: BACKGROUND_COLOR,
        elevation: 0,
        actions: [
          IconButton(
              onPressed: () {
                Navigator.push(context, MaterialPageRoute(builder: (context) {
                  return SignIn();
                }));
              },
              icon: Icon(
                Icons.login,
                color: Colors.black,
              ))
        ],
        leading: IconButton(
          icon: Icon(
            Icons.arrow_back_rounded,
            color: BLACK,
          ),
          onPressed: () {
            Navigator.pop(context);
          },
        ),
      ),
      body: Column(
        children: [
          Text(
            "Register Here",
            style: TextStyle(
              fontSize: 32,
            //  fontFamily: FONT,
              fontWeight: FontWeight.bold,
            ),
          ),
          Text(
            "We can't wait to work with you",
            style: TextStyle(
                fontSize: 15,
                fontFamily: "Montserrat",
                fontWeight: FontWeight.w500,
                color: BLACK),
          ),
          Container(
              margin: EdgeInsets.fromLTRB(20, 20, 20, 10),
              child: Column(
                children: [
                  TextField(
                   // style: TextStyle(fontFamily: FONT),
                    decoration: InputDecoration(
                        hintText: "Enter Email",
                        prefixIcon: Icon(Icons.email_outlined)
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.fromLTRB(0, 10, 0, 0),
                    child: TextField(
                      obscureText: true,
                  //   style: TextStyle(fontFamily: FONT),
                      decoration: InputDecoration(
                          hintText: "Enter Password",
                         prefixIcon: Icon(Icons.password)),
                    ),
                  )
                ],
              )),
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 12),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.stretch,
              children: [
                Button(color: BUTTON_COLOR, text: "Sign Up", onPressed: () {}),
              ],
            ),
          )
        ],
      ),
    );
  }
}
