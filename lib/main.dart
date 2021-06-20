import 'package:flutter/material.dart';
import 'package:soul_nourisher/Screens/MainScreen.dart';
import 'package:firebase_core/firebase_core.dart';

Future main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp();
  runApp(First());
}


class First extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Test(),
    );
  }
}
