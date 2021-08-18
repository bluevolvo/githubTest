import 'package:flutter/material.dart';
import 'package:project1_login/Refactors/DataContainer.dart';
import 'package:project1_login/Pages/Profile%20Page.dart';
import 'package:project1_login/Refactors/Parameters.dart';
import 'package:project1_login/Refactors/sheet.dart';

class MainPage extends StatefulWidget {
  @override
  _MainPageState createState() => _MainPageState();
}

class _MainPageState extends State<MainPage> {
  List<Parameters> parameterList = [];
  TextEditingController title = TextEditingController();
  TextEditingController email = TextEditingController();
  TextEditingController password = TextEditingController();

  @override
  void dispose() {
    title.dispose();
    email.dispose();
    password.dispose();
    super.dispose();
  }

  String image(String image) {
    return image = "images/$image.jpg";
  }


  @override
  Widget build(BuildContext context) {
    return Scaffold(
      floatingActionButton: MyModalSheet(
        text: title,
        email: email,
        password: password,
        onPressed: () {
          Navigator.pop(context);
          setState(() {
            parameterList.add(Parameters(
              title: title.text,
              email: email.text,
              password: password.text,
            ));
            title.clear();
            email.clear();
            password.clear();
          });
        },
      ),
      appBar: AppBar(
        centerTitle: true,
        title: (Text(
          "Welcome Back!",
          style: TextStyle(color: Colors.white),
        )),
        elevation: 0,
      ),
      body: ListView.builder(
          itemCount: parameterList.length,
          itemBuilder: (context, index) {
            return DataContainer(
              title: parameterList[index].title,
              email: parameterList[index].email,
              image: image(parameterList[index].title),
              onTap: () {
                Navigator.push(context, MaterialPageRoute(builder: (context) {
                  return ProfilePage(
                    title: parameterList[index].title,
                    password: parameterList[index].password,
                    email: parameterList[index].email,
                    image: image(parameterList[index].title),
                  );
                }));
              },
            );
          }),
    );
  }
}
