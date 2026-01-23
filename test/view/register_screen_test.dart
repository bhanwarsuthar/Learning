import 'package:flutter_test/flutter_test.dart';
import 'package:learning/common/utils/validations/edit_text_validation.dart';

void main(){
  group('input username validation', () {
    test('username is empty', (){
      String username = '';
      final result = EditTextValidation().userNameValidation(username);
      expect(result, false);
    });

    test('username less than 3 characters', (){
      String username = 'ma';
      final result = EditTextValidation().userNameValidation(username);
      expect(result, false);
    });

    //not allowed special characters in username
    test('username with special characters', (){
      String username = 'marwa@123!';
      final result = EditTextValidation().userNameValidation(username);
      expect(result, false);
    });

    test('valid username', (){
      String username = 'marwa';
      final result = EditTextValidation().userNameValidation(username);
      expect(result, true);
    });
  });

  group('input email address validation', (){
    test('email address is empty', (){
      String email = '';
      final result = EditTextValidation().emailValidation(email);
      expect(result, false);
    });

    test('invalid without @ email address', (){
      String email = 'marwagmail.com';
      final result = EditTextValidation().emailValidation(email);
      expect(result, false);
    });

    test('invalid without .com email address', (){
      String email = 'marwa@gmail';
      final result = EditTextValidation().emailValidation(email);
      expect(result, false);
    });

    test('invalid without domain name email address', (){
      String email = 'marwa@';
      final result = EditTextValidation().emailValidation(email);
      expect(result, false);
    });

    test('valid email address', () {
      String email = 'suthar@gmail.com';
      final result = EditTextValidation().emailValidation(email);
      expect(result, true);
    });

    test('valid company email address', () {
      String email = 'suthar@marwadtech.com';
      final result = EditTextValidation().emailValidation(email);
      expect(result, true);
    });
  });

  //address
  group('input address validation', (){
    test('address is empty', (){
      String address = '';
      final result = EditTextValidation().addressValidation(address);
      expect(result, false);
    });

    test('address min char', (){
      String address = 'ti';
      final result = EditTextValidation().addressValidation(address);
      expect(result, false);
    });

    test('valid address', (){
      String address = 'Timber market, Vishvakarma cross road, sumerpur, pali, rajasthan (306902)';
      final result = EditTextValidation().addressValidation(address);
      expect(result, true);
    });
  });

  //password min 8 char
  group('input password validation', (){
    test('password is empty', (){
      String password = '';
      final result = EditTextValidation().passwordValidation(password);
      expect(result, false);
    });

    test('password less than 8 char', (){
      String password = 'marwa12';
      final result = EditTextValidation().passwordValidation(password);
      expect(result, false);
    });

    test('valid password', (){
      String password = 'marwa123';
      final result = EditTextValidation().passwordValidation(password);
      expect(result, true);
    });
  });

  //confirm password
  group('input confirm password validation', (){
    test('confirm password is empty', (){
      String password = 'marwa123';
      String confirmPassword = '';
      final result = EditTextValidation().confirmPasswordValidation(password, confirmPassword);
      expect(result, false);
    });
    test('confirm password not match', (){
      String password = 'marwa123';
      String confirmPassword = 'marwa12';
      final result = EditTextValidation().confirmPasswordValidation(password, confirmPassword);
      expect(result, false);
    });
    test('valid confirm password', (){
      String password = 'marwa123';
      String confirmPassword = 'marwa123';
      final result = EditTextValidation().confirmPasswordValidation(password, confirmPassword);
      expect(result, true);
    });
  });
}