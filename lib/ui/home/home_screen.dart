import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:social_media_app/customs/custom_btn.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  TextEditingController _captionController = TextEditingController();
  final _ref = FirebaseFirestore.instance.collection('caption');

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
                  Container(
                    height: 250,
                    width: double.infinity,
                    decoration: BoxDecoration(
                        border: Border.all(color: Colors.black87),
                        borderRadius: BorderRadius.circular(10)),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      mainAxisAlignment: MainAxisAlignment.start,
                      children: [
                        SizedBox(
                          height: 10,
                        ),
                        Text(
                          "  Tap to Upload image",
                          style: TextStyle(fontSize: 16),
                        )
                      ],
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
