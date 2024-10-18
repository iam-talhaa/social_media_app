import 'dart:io';

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';
import 'package:social_media_app/customs/custom_btn.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  TextEditingController _captionController = TextEditingController();
  final _ref = FirebaseFirestore.instance.collection('caption');
  XFile? image;
  File? imagefile;

  void Pick_image() async {
    final ImagePicker _picker = ImagePicker();
    image = await _picker.pickImage(source: ImageSource.gallery);

    if (image == null) {
      return;
    } else {
      imagefile = File(image!.path);
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Home screen "),
      ),
      floatingActionButton: FloatingActionButton(onPressed: () {
        final id = DateTime.now().millisecondsSinceEpoch.toString();
      }),
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 10),
        child: Column(
          children: [
            Container(
              height: 500,
              width: double.infinity,
              decoration: BoxDecoration(),
              child: Column(
                children: [
                  SizedBox(
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
                          ? Image.file(
                              File(image!.path),
                              height: 300.0,
                              width: 300.0,
                            )
                          : Row(
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
                        prefixIcon: Icon(Icons.image),
                        hintText: "  Image Caption",
                        border: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(13)),
                        focusedBorder: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(13))),
                  ),
                  SizedBox(
                    height: 20,
                  ),
                  Custom_btn(
                      B_height: 45.0,
                      B_text: "Upload Post",
                      ontap: () {},
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
