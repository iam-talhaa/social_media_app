import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:social_media_app/ui/auth/login.dart';
import 'package:social_media_app/ui/auth/signup.dart';
import 'package:social_media_app/ui/home/home_screen.dart';
import 'package:firebase_core/firebase_core.dart';
import 'firebase_options.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp(
    options: DefaultFirebaseOptions.currentPlatform,
  );
  runApp(Social_media_App());
}

class Social_media_App extends StatefulWidget {
  const Social_media_App({super.key});

  @override
  State<Social_media_App> createState() => _Social_media_AppState();
}

class _Social_media_AppState extends State<Social_media_App> {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(debugShowCheckedModeBanner: false, home: HomeScreen());
  }
}
