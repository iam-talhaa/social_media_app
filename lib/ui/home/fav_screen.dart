import 'package:flutter/material.dart';

class Fav_screen extends StatefulWidget {
  const Fav_screen({super.key});

  @override
  State<Fav_screen> createState() => _Fav_screenState();
}

class _Fav_screenState extends State<Fav_screen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        children: [Text('Fav Screen')],
      ),
    );
    ;
  }
}
