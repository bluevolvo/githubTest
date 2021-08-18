import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:project1_login/Refactors/Button.dart';
import 'package:project1_login/Pages/SignIn.dart';
import 'package:project1_login/Pages/SignUp.dart';

import 'package:project1_login/Refactors/Constants.dart';

class LandingPage extends StatefulWidget {
  @override
  _LandingPageState createState() => _LandingPageState();
}

class _LandingPageState extends State<LandingPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(

        body: SafeArea(
          child: Column(
              crossAxisAlignment: CrossAxisAlignment.center,
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                Center(
                  child: Container(
                    child: Image.asset("images/march.png"),
                  ),
                ),
                Container(
                  child: Column(
                    children: [
                      Text(
                        "VAULT",
                        style: TextStyle(
                            color: Colors.black,

                            fontSize: 35),
                      ),
                      Text(
                        "Your secret is safe with us",
                        style: TextStyle(
                            color: Colors.black,
                            fontFamily: "Montserrat",
                            fontSize: 15),
                      ),
                    ],
                  ),
                ),
                Container(
                  margin: EdgeInsets.symmetric(horizontal: 25),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.stretch,
                    children: [
                      Button(
                        color: BUTTON_COLOR,
                        text: "Sign Up",
                        onPressed: () {
                          Navigator.push(context,
                              MaterialPageRoute(builder: (context) {
                            return SignUp();
                          }));
                        },
                      ),
                      Button(
                          color: BUTTON_COLOR,
                          onPressed: () {
                            Navigator.push(context,
                                MaterialPageRoute(builder: (context) {
                              return SignIn();
                            }));
                          },
                          text: "Sign In")
                    ],
                  ),
                )
              ]),
        ));
  }
}
