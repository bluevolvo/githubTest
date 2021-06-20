import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_storage/firebase_storage.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:soul_nourisher/Logic/Constants.dart';
import 'package:soul_nourisher/Screens/Screen2.dart';
import 'package:image_picker/image_picker.dart';
import 'dart:io';
import 'package:soul_nourisher/Logic/ListLogic.dart';

class Test extends StatefulWidget {
  @override
  _TestState createState() => _TestState();
}

class _TestState extends State<Test> {
  // ListLogic _listLogic = ListLogic();
  late final TextEditingController text = TextEditingController();
  late File _image;

  String rec = kdemoImage;
  ListLogic _listLogic = ListLogic();

  getImage() async {
     var img = await _listLogic.getImageFromGallery();
    setState(() {
      _image = File(img);
    });

    // a variable holding the image which has been put in firebase storage
    var snapshot = await FirebaseStorage.instance
        .ref(
            "image${_listLogic.fireStoreCounter}")
        .putFile(_image);
    // using that variable to gain access to the download url property
    var receipt = await snapshot.ref.getDownloadURL();

    //setState to cater for changing urls
    setState(() {
      rec = receipt;
    });
    // when there is a new url its added to the list
    //images.add(rec);
    print("done");
  }

  @override
  void dispose() {
    text.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        floatingActionButton: FloatingActionButton(
          child: kIcon,
          backgroundColor: kPurple,
          onPressed: () {
            showModalBottomSheet(
                isScrollControlled: false,
                shape: kBorderRadius,
                backgroundColor: kBlack,
                context: context,
                builder: (context) {
                  return Column(
                    children: [
                       CircleAvatar(
                          backgroundImage: NetworkImage(rec),
                          radius: 60,
                      ),
                      Padding(
                        padding: const EdgeInsets.all(10),
                        child: TextField(
                          controller: text,
                          decoration: kDeco,
                        ),
                      ),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          TextButton(
                              onPressed: () async {
                                await _listLogic.addToDatabase(
                                    title: text.text, url: rec);
                              },
                              child: Text(
                                "Send",
                                style: TextStyle(color: kWhite),
                              )),
                          TextButton(
                              onPressed: ()  {
                              getImage();
                              },
                              child: Text(
                                "Add Image",
                                style: TextStyle(color: kWhite),
                              ))
                        ],
                      )
                    ],
                  );
                });
          },
        ),
        backgroundColor: kBlack,
        appBar: AppBar(
          centerTitle: true,
          elevation: 10,
          backgroundColor: kPurple,
          title: Text(
            "Devotion",
            style: TextStyle(color: kWhite, fontSize: 15),
          ),
        ),
        body: Column(children: [
          FutureBuilder<QuerySnapshot>(
              future: _listLogic.getFromDatabase(collection: "Start"),
              builder: (context, snapshot) {
                if (!snapshot.hasData) {
                  return Center(child: CircularProgressIndicator());
                }
                return Expanded(
                  child: ListView.builder(
                      itemCount: snapshot.data!.docs.length,
                      itemBuilder: (context, int index) {
                        return Padding(
                          padding: const EdgeInsets.all(10),
                          child: Material(
                              // margin: EdgeInsets.symmetric(horizontal: 10),
                              elevation: 4,
                              child: Column(
                                children: [
                                  Material(
                                    child: ListTile(
                                      leading: Hero(
                                          tag: "dash$index",
                                          child: ClipRRect(
                                            child: Image.network(snapshot
                                                .data!.docs[index]["url"]),
                                            borderRadius: BorderRadius.all(
                                                Radius.circular(10)),
                                          )),
                                      title: Text(
                                        snapshot.data!.docs[index]["title"],
                                        style: TextStyle(
                                            color: Colors.white,
                                            fontWeight: FontWeight.w700),
                                      ),
                                      subtitle: Text("hi",
                                          style: TextStyle(
                                            color: Colors.grey,
                                          )),
                                      tileColor: kBlack,
                                      onTap: () {
                                        Navigator.push(context,
                                            MaterialPageRoute(
                                                builder: (context) {
                                          return Screen2(
                                            title: snapshot.data!.docs[index]
                                                ["title"],
                                            tag: snapshot.data!.docs.length,
                                            image: snapshot.data!.docs[index]
                                                ["url"],
                                          );
                                        }));
                                      },
                                    ),
                                  )
                                ],
                              )),
                        );
                      }),
                );
              })
        ]));
  }
}

//752092
