import 'package:flutter/cupertino.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:image_picker/image_picker.dart';
import 'dart:io';

import 'Model1.dart';

final picker = ImagePicker();

//late File _image;
class ListLogic {
  Future addToDatabase({required String title, required String url}) async {
    await FirebaseFirestore.instance
        .collection("Start")
        .add({"title": title, "url": url});
  }

  Future<QuerySnapshot> getFromDatabase({required String collection}) async =>
      await FirebaseFirestore.instance.collection("Start").get();

  final fireStoreCounter =
      FirebaseFirestore.instance.collection("Start").toString().length;

  getImageFromGallery() async {
    // getting image from gallery and returns path
    final img = await picker.getImage(source: ImageSource.gallery);
    return img!.path;
  }
}
