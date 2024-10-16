import 'package:flutter/material.dart';
import 'package:social_media_app/ui/home/home_screen.dart';

void main() {
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
