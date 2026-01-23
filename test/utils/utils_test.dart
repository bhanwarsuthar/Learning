import 'package:flutter_test/flutter_test.dart';
import 'package:learning/utils/utils.dart';


void main(){
  group('flutter toast', (){
    test('show toast message', (){
      String message = 'This is a toast message';
      expect(() {
         Utils.showToast(message);
      }, returnsNormally);
    });

    test('do not show the toast message', (){
      String message = '';
      expect(() {
         Utils.showToast(message);
      }, returnsNormally);
    });
  });
}