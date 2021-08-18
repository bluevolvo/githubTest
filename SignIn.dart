import 'package:flutter/material.dart';
import 'package:project1_login/Refactors/Constants.dart';
import 'package:project1_login/Refactors/Button.dart';
import 'package:project1_login/Pages/Land.dart';

class SignIn extends StatefulWidget {
  @override
  _SignInState createState() => _SignInState();
}

class _SignInState extends State<SignIn> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: BACKGROUND_COLOR,
        elevation: 0,
        leading: IconButton(
          icon: Icon(
            Icons.arrow_back_rounded,
            color: BLACK,
          ),
          onPressed: () {
            Navigator.push(context, MaterialPageRoute(builder: (context) {
              return LandingPage();
            }));
          },
        ),
      ),
      body: Column(
        children: [
          Text(
            "Login Here",
            style: TextStyle(
              fontSize: 32,
              fontWeight: FontWeight.bold,
            ),
          ),
          Text(
            "Glad you came back",
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
                //    style: TextStyle(fontFamily: FONT),
                    decoration: InputDecoration(
                        hintText: "Enter Email",
                        prefixIcon: Icon(Icons.email_outlined)),
                  ),
                  Padding(
                    padding: const EdgeInsets.fromLTRB(0, 10, 0, 0),
                    child: TextField(
                      obscureText: true,

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
                Button(
                  text: "Sign In",
                  onPressed: () {},
                  color: BUTTON_COLOR,
                ),
              ],
            ),
          )
        ],
      ),
    );
  }
}
