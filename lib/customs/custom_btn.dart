import 'package:flutter/material.dart';

class Custom_btn extends StatefulWidget {
  final B_height;
  final B_width;
  final B_text;
  final VoidCallback ontap;
  Custom_btn(
      {super.key,
      required this.B_height,
      required this.B_text,
      required this.ontap,
      required this.B_width});

  @override
  State<Custom_btn> createState() => _Custom_btnState();
}

class _Custom_btnState extends State<Custom_btn> {
  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: widget.ontap,
      child: Container(
        height: widget.B_height,
        width: widget.B_width,
        decoration: BoxDecoration(
            color: Colors.indigo[300], borderRadius: BorderRadius.circular(15)),
        child: Center(
            child: Text(
          widget.B_text,
          style: TextStyle(fontSize: 20, color: Colors.white),
        )),
      ),
    );
  }
}
