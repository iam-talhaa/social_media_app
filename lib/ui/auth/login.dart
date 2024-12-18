import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:social_media_app/customs/custom_btn.dart';
import 'package:social_media_app/ui/auth/signup.dart';
import 'package:social_media_app/ui/home/home_screen.dart';
import 'package:social_media_app/utils/UTILS.dart';

class Login_screen extends StatefulWidget {
  const Login_screen({super.key});

  @override
  State<Login_screen> createState() => _Login_screenState();
}

class _Login_screenState extends State<Login_screen> {
  TextEditingController _emaiController = TextEditingController();
  TextEditingController _passwordController = TextEditingController();
  FirebaseAuth _auth = FirebaseAuth.instance;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          "Login Screen",
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
              "Log in",
              style: TextStyle(
                  fontSize: 40,
                  fontWeight: FontWeight.bold,
                  color: Colors.indigo[400]),
            ),
            SizedBox(
              height: 100,
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
              height: 20,
            ),
            TextFormField(
              controller: _passwordController,
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
                Text("Don't Have an Account"),
                TextButton(
                  onPressed: () {
                    Navigator.of(context).push(MaterialPageRoute(
                        builder: (context) => Signup_screen()));
                  },
                  child: Text(
                    "Signup",
                    style: TextStyle(color: Colors.blue),
                  ),
                )
              ],
            ),
            SizedBox(
              height: 30,
            ),
            Custom_btn(
              B_height: 45.0,
              B_text: "login",
              B_width: 150.0,
              ontap: () {
                _auth
                    .signInWithEmailAndPassword(
                        email: _emaiController.text.trim().toString(),
                        password: _passwordController.text.trim().toString())
                    .then((v) {
                  Utils().FlutterToast("Login Successfully", Colors.blue);
                  Navigator.of(context).push(
                      MaterialPageRoute(builder: (context) => HomeScreen()));
                }).onError((error, s) {
                  Utils().FlutterToast(error.toString(), Colors.red);
                });
              },
            )
          ],
        ),
      ),
    );
  }
}
