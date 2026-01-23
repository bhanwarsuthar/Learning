import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:another_flushbar/flushbar.dart';

class Utils {
  static void showToast(String message) {
    Fluttertoast.showToast(msg: message);
  }


  static void flushBarMessage(BuildContext context, String title, String message) {
    // Implementation for showing flush bar error message
    Flushbar(
      title: title,
      message: message,
      flushbarPosition: FlushbarPosition.TOP,
      backgroundColor: Color(0xFF000000),
      duration: Duration(seconds: 3),
    ).show(context);
  }

  static void snackBarMessage(BuildContext context, String message) {
    final snackBar = SnackBar(content: Text(message));
    ScaffoldMessenger.of(context).showSnackBar(snackBar);
  }

  static void fieldFocusChange(BuildContext context, FocusNode currentFocus, FocusNode nextFocus) {
    currentFocus.unfocus();
    FocusScope.of(context).requestFocus(nextFocus);
  }
}