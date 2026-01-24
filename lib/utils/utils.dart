import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:another_flushbar/flushbar.dart';
import 'package:learning/utils/filed_focus_change_service.dart';
import 'package:learning/utils/snack_bar_message_service.dart';
import 'package:learning/utils/toast_service.dart';

import 'flush_bar_message_service.dart';



class Utils {
  static ToastService toastService = FlutterToastService();
  static FlushBarMessageService flushBarMessageService = FlutterFlushBarMessageService();
  static SnackBarMessageService snackBarMessageService = FlutterSnackBarMessageService();
  static FieldFocusChangeService fieldFocusChangeService = FlutterFieldFocusChangeService();

  static void showToast(String message) {
    toastService.showToast(message);
  }


  static void flushBarMessage(BuildContext context, String title, String message) {
    flushBarMessageService.showFlushBarMessage(context, title, message);
  }


  static void snackBarMessage(BuildContext context, String message) {
    snackBarMessageService.showSnackBarMessage(context, message);
  }


  static void fieldFocusChange(BuildContext context, FocusNode currentFocus, FocusNode nextFocus) {
    fieldFocusChangeService.fieldFocusChange(context: context, currentFocus: currentFocus, nextFocus: nextFocus);
  }
}