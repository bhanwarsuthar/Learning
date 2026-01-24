import 'package:another_flushbar/flushbar.dart';
import 'package:flutter/cupertino.dart';

abstract class FlushBarMessageService {
  void showFlushBarMessage(BuildContext context, String title, String message);
}

class FlutterFlushBarMessageService implements FlushBarMessageService {
  @override
  void showFlushBarMessage(BuildContext context, String title, String message) {
    Flushbar(
      title: title,
      message: message,
      flushbarPosition: FlushbarPosition.TOP,
      backgroundColor: Color(0xFF000000),
      duration: Duration(seconds: 3),
    ).show(context);
  }
}