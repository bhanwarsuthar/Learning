import 'package:flutter/cupertino.dart';

abstract class FieldFocusChangeService {
  void fieldFocusChange(
      {required dynamic context,
      required dynamic currentFocus,
      required dynamic nextFocus});
}

class FlutterFieldFocusChangeService implements FieldFocusChangeService {
  @override
  void fieldFocusChange(
      {required dynamic context,
      required dynamic currentFocus,
      required dynamic nextFocus}) {
    currentFocus.unfocus();
    FocusScope.of(context).requestFocus(nextFocus);
  }
}

