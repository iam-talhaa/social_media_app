import 'dart:io';

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_storage/firebase_storage.dart';
import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';
import 'package:salomon_bottom_bar/salomon_bottom_bar.dart';
import 'package:social_media_app/customs/custom_btn.dart';
import 'package:social_media_app/utils/UTILS.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  TextEditingController _captionController = TextEditingController();
  FirebaseFirestore _ref = FirebaseFirestore.instance;
  XFile? image;
  File? imagefile;
  String url = '';

  void Pick_image() async {
    final ImagePicker _picker = ImagePicker();
    image = await _picker.pickImage(source: ImageSource.camera);

    if (image == null) {
      return;
    } else {
      imagefile = File(image!.path);
    }
  }

  void Add_image() async {
    if (imagefile != null) {
      String fileName = DateTime.now().millisecondsSinceEpoch.toString();

      Reference firebaseStorage =
          FirebaseStorage.instance.ref().child('image/$fileName');

      UploadTask uploadTask = firebaseStorage.putFile(imagefile!);

      await uploadTask;

      url = await firebaseStorage.getDownloadURL();
    }
  }

  void Add_caption() {
    String id = DateTime.now().millisecondsSinceEpoch.toString();

    if (_captionController.text.isEmpty) {
      Utils().FlutterToast("Enter Caption", Colors.red);

      return;
    } else {
      _ref.collection('caption').doc(id).set(
          {'caption': _captionController.text.trim().toString()}).then((v) {
        Utils().FlutterToast("Data Added", Colors.blue);
        _captionController.clear();
      }).onError((error, s) {
        Utils().FlutterToast(error.toString(), Colors.red);
      });
    }
  }

  var _currentIndex = 0;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Home screen "),
      ),
      bottomNavigationBar: SalomonBottomBar(
        currentIndex: _currentIndex,
        onTap: (i) => setState(() => _currentIndex = i),
        items: [
          /// Home
          SalomonBottomBarItem(
            icon: Icon(Icons.home),
            title: Text("Home"),
            selectedColor: Colors.purple,
          ),

          /// Likes
          SalomonBottomBarItem(
            icon: Icon(Icons.favorite_border),
            title: Text("Likes"),
            selectedColor: Colors.pink,
          ),

          /// Search
          SalomonBottomBarItem(
            icon: Icon(Icons.add),
            title: Text("Search"),
            selectedColor: Colors.orange,
          ),

          /// Profile
          SalomonBottomBarItem(
            icon: Icon(Icons.person),
            title: Text("Profile"),
            selectedColor: Colors.teal,
          ),
        ],
      ),
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 10),
        child: Column(
          children: [
            Container(
              height: 500,
              width: double.infinity,
              decoration: const BoxDecoration(),
              child: Column(
                children: [
                  const SizedBox(
                    height: 20,
                  ),
                  GestureDetector(
                    onTap: () {
                      Pick_image();
                      print('Image pick');
                    },
                    child: Container(
                      height: 250,
                      width: double.infinity,
                      decoration: BoxDecoration(
                          border: Border.all(color: Colors.black87),
                          borderRadius: BorderRadius.circular(10)),
                      child: image != null
                          ? Container(
                              color: Colors.red,
                              child: Image.file(
                                File(image!.path),
                                height: 300.0,
                                width: 300.0,
                              ),
                            )
                          : const Row(
                              crossAxisAlignment: CrossAxisAlignment.center,
                              mainAxisAlignment: MainAxisAlignment.center,
                              children: [
                                SizedBox(
                                  height: 10,
                                ),
                                Icon(Icons.upload_rounded),
                                Text(
                                  "  Tap to Upload image",
                                  style: TextStyle(
                                      fontSize: 16,
                                      fontWeight: FontWeight.bold),
                                )
                              ],
                            ),
                    ),
                  ),
                  TextFormField(
                    controller: _captionController,
                    maxLines: 1,
                    decoration: InputDecoration(
                        prefixIcon: const Icon(Icons.image),
                        hintText: "  Image Caption",
                        border: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(13)),
                        focusedBorder: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(13))),
                  ),
                  const SizedBox(
                    height: 20,
                  ),
                  Custom_btn(
                      B_height: 45.0,
                      B_text: "Upload Post",
                      ontap: () {
                        Add_image();
                        Add_caption();
                      },
                      B_width: 190.0)
                ],
              ),
            )
          ],
        ),
      ),
    );
  }
}
