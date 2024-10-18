import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';

class Utils {
  void FlutterToast(String msg, Color T_color) {
    Fluttertoast.showToast(
        msg: msg,
        toastLength: Toast.LENGTH_LONG,
        gravity: ToastGravity.CENTER,
        timeInSecForIosWeb: 1,
        backgroundColor: T_color,
        textColor: Colors.white,
        fontSize: 16.0);
  }
}
