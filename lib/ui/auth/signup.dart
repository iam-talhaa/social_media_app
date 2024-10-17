import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:dropdown_search/dropdown_search.dart';
import 'package:flutter/material.dart';
import 'package:social_media_app/customs/custom_btn.dart';

class Signup_screen extends StatefulWidget {
  const Signup_screen({super.key});

  @override
  State<Signup_screen> createState() => _Signup_screenState();
}

class _Signup_screenState extends State<Signup_screen> {
  TextEditingController _emaiController = TextEditingController();
  TextEditingController _passController = TextEditingController();
  TextEditingController _nameController = TextEditingController();
  TextEditingController _ageController = TextEditingController();
  TextEditingController _genderController = TextEditingController();

  final ref = FirebaseFirestore.instance.collection('User');

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          "SignUP SCREEN",
          style: TextStyle(color: Colors.white),
        ),
        backgroundColor: Colors.indigo[400],
        centerTitle: true,
      ),
      body: Padding(
        padding: const EdgeInsets.symmetric(
          horizontal: 10,
        ),
        child: Column(
          children: [
            Text(
              "Sign Up ",
              style: TextStyle(
                  fontSize: 40,
                  fontWeight: FontWeight.bold,
                  color: Colors.indigo[400]),
            ),
            SizedBox(
              height: 20,
            ),
            TextFormField(
              controller: _nameController,
              decoration: InputDecoration(
                  prefixIcon: Icon(Icons.person),
                  hintText: "Name",
                  border: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(13)),
                  focusedBorder: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(13))),
            ),
            SizedBox(
              height: 10,
            ),
            TextFormField(
              controller: _emaiController,
              decoration: InputDecoration(
                  prefixIcon: Icon(Icons.mail_outline),
                  hintText: "Enter Your  Email",
                  border: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(13)),
                  focusedBorder: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(13))),
            ),
            SizedBox(
              height: 10,
            ),
            TextFormField(
              controller: _ageController,
              decoration: InputDecoration(
                  prefixIcon: Icon(Icons.label_important_outline_sharp),
                  hintText: "Age",
                  border: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(13)),
                  focusedBorder: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(13))),
            ),
            SizedBox(
              height: 10,
            ),
            DropdownSearch<String>(
                selectedItem: "Gender",
                items: (filter, infiniteScrollProps) => [
                      "Male",
                      "Female",
                    ],
                decoratorProps: DropDownDecoratorProps(
                  decoration: InputDecoration(
                    labelText: 'Gender ',
                    border: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(13)),
                  ),
                )),
            SizedBox(
              height: 10,
            ),
            TextFormField(
              controller: _passController,
              decoration: InputDecoration(
                  prefixIcon: Icon(Icons.password_outlined),
                  hintText: "Password",
                  border: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(13)),
                  focusedBorder: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(13))),
            ),
            SizedBox(
              height: 10,
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Text("Already Have an Account?"),
                TextButton(
                  onPressed: () {},
                  child: Text(
                    "login",
                    style: TextStyle(color: Colors.blue),
                  ),
                )
              ],
            ),
            SizedBox(
              height: 20,
            ),
            Custom_btn(
              B_height: 45.0,
              B_text: "Sign Up ",
              B_width: 150.0,
              ontap: () {},
            )
          ],
        ),
      ),
    );
  }
}
