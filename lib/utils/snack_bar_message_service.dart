import 'package:flutter/material.dart';

abstract class SnackBarMessageService {
  void showSnackBarMessage(BuildContext context, String message);
}

class FlutterSnackBarMessageService implements SnackBarMessageService {
  @override
  void showSnackBarMessage(BuildContext context, String message) {
    final snackBar = SnackBar(content: Text(message));
    ScaffoldMessenger.of(context).showSnackBar(snackBar);
  }
}
