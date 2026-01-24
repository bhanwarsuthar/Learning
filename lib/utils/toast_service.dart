import 'package:fluttertoast/fluttertoast.dart';

abstract class ToastService {
  void showToast(String message);
}

class FlutterToastService implements ToastService {
  @override
  void showToast(String message) {
     Fluttertoast.showToast(msg: message);
  }
}