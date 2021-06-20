import 'package:flutter/material.dart';

const String kdemoImage = "https://www.orbcfamily.org/site/wp-content/uploads/2019/04/Depositphotos_225669932_s-2019.jpg";
const kPurple = Color(0xFF643173);
const kWhite = Colors.white;
const kBlack = Color(0XFF333333);
const Icon kIcon =Icon(Icons.add);
const InputDecoration kDeco = InputDecoration(
  hintText: "Enter Title",
  hintStyle: TextStyle(color: Colors.white),
  enabledBorder: OutlineInputBorder(
      borderRadius: BorderRadius.all(Radius.circular(10)),
      borderSide: BorderSide(color: kPurple)),
);
const RoundedRectangleBorder kBorderRadius =RoundedRectangleBorder(
    borderRadius:
    BorderRadius.vertical(top: Radius.circular(20)));