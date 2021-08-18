import 'package:flutter/material.dart';
import 'FormField.dart';

class MyModalSheet extends StatelessWidget {
  final TextEditingController text;
  final TextEditingController email;
  final TextEditingController password;
  final Function() onPressed;

  MyModalSheet(
      {required this.text,
      required this.email,
      required this.password,
      required this.onPressed});

  @override
  Widget build(BuildContext context) {
    return FloatingActionButton(
      onPressed: () {
        showModalBottomSheet(
            isScrollControlled: true,
            barrierColor: Colors.transparent,
            shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.only(
                    topLeft: Radius.circular(30),
                    topRight: Radius.circular(30))),
            context: context,
            builder: (BuildContext context) {
              return Container(
                margin: EdgeInsets.symmetric(vertical: 35),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Entries(
                      text: text,
                      category: "Title",
                      icon: Icons.account_circle_outlined,
                    ),
                    Entries(
                        text: email,
                        category: "Email/Username",
                        icon: Icons.email_outlined),
                    Entries(
                        text: password,
                        category: "Password",
                        icon: Icons.password_rounded),
                    Column(
                      crossAxisAlignment: CrossAxisAlignment.stretch,
                      children: [
                        Padding(
                          padding: const EdgeInsets.symmetric(horizontal: 13),
                          child: TextButton(
                              onPressed: onPressed,
                              child: Text(
                                "Save",
                                style: TextStyle(
                                  fontSize: 17,
                                ),
                              ),
                              style: ButtonStyle(
                                  shape: MaterialStateProperty.all<
                                          RoundedRectangleBorder>(
                                      RoundedRectangleBorder(
                                          borderRadius: BorderRadius.all(
                                              Radius.circular(10)))))),
                        )
                      ],
                    )
                  ],
                ),
              );
            });
      },
      child: Icon(
        Icons.add,
      ),
    );
  }
}
