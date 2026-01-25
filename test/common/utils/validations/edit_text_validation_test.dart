import 'package:flutter_test/flutter_test.dart';
import 'package:learning/common/utils/validations/edit_text_validation.dart';

void main(){
  group('input username validation', () {
    test('username is empty', (){
      String username = '';
      final result = EditTextValidation.userNameValidation(username);
      expect(result, false);
    });

    test('username less than 3 characters', (){
      String username = 'ma';
      final result = EditTextValidation.userNameValidation(username);
      expect(result, false);
    });

    //not allowed special characters in username
    test('username with special characters', (){
      String username = 'marwa@123!';
      final result = EditTextValidation.userNameValidation(username);
      expect(result, false);
    });

    test('valid username', (){
      String username = 'marwa';
      final result = EditTextValidation.userNameValidation(username);
      expect(result, true);
    });
  });

  group('input email address validation', (){
    test('email address is empty', (){
      String email = '';
      final result = EditTextValidation.emailValidation(email);
      expect(result, false);
    });

    test('invalid without @ email address', (){
      String email = 'marwagmail.com';
      final result = EditTextValidation.emailValidation(email);
      expect(result, false);
    });

    test('invalid without .com email address', (){
      String email = 'marwa@gmail';
      final result = EditTextValidation.emailValidation(email);
      expect(result, false);
    });

    test('invalid without domain name email address', (){
      String email = 'marwa@';
      final result = EditTextValidation.emailValidation(email);
      expect(result, false);
    });

    test('valid email address', () {
      String email = 'suthar@gmail.com';
      final result = EditTextValidation.emailValidation(email);
      expect(result, true);
    });

    test('valid company email address', () {
      String email = 'suthar@marwadtech.com';
      final result = EditTextValidation.emailValidation(email);
      expect(result, true);
    });
  });

  //address
  group('input address validation', (){
    test('address is empty', (){
      String address = '';
      final result = EditTextValidation.addressValidation(address);
      expect(result, false);
    });

    test('address min char', (){
      String address = 'ti';
      final result = EditTextValidation.addressValidation(address);
      expect(result, false);
    });

    test('valid address', (){
      String address = 'Timber market, Vishvakarma cross road, sumerpur, pali, rajasthan (306902)';
      final result = EditTextValidation.addressValidation(address);
      expect(result, true);
    });
  });

  //password min 8 char
  group('input password validation', (){
    test('password is empty', (){
      String password = '';
      final result = EditTextValidation.passwordValidation(password);
      expect(result, false);
    });

    test('password less than 8 char', (){
      String password = 'marwa12';
      final result = EditTextValidation.passwordValidation(password);
      expect(result, false);
    });

    test('valid password', (){
      String password = 'marwa123';
      final result = EditTextValidation.passwordValidation(password);
      expect(result, true);
    });
  });

  //confirm password
  group('input confirm password validation', (){
    test('confirm password is empty', (){
      String password = 'marwa123';
      String confirmPassword = '';
      final result = EditTextValidation.confirmPasswordValidation(password, confirmPassword);
      expect(result, false);
    });
    test('confirm password not match', (){
      String password = 'marwa123';
      String confirmPassword = 'marwa12';
      final result = EditTextValidation.confirmPasswordValidation(password, confirmPassword);
      expect(result, false);
    });
    test('valid confirm password', (){
      String password = 'marwa123';
      String confirmPassword = 'marwa123';
      final result = EditTextValidation.confirmPasswordValidation(password, confirmPassword);
      expect(result, true);
    });
  });


  group('name validator', (){
    test('name is empty', (){
      String name = '';
      final result = EditTextValidation.nameValidator(name);
      expect(result, null);
    });

    test('invalid name', (){
      String name = 'ma';
      final result = EditTextValidation.nameValidator(name);
      expect(result, "Name must be at least 3 characters long");
    });

    test('valid name', () {
      String name = 'marwa';
      final result = EditTextValidation.nameValidator(name);
      expect(result, null);
    });
  });

  group('email validator', (){
    test('email is empty', (){
      String email = '';
      final result = EditTextValidation.emailValidator(email);
      expect(result, null);
    });

    test('valid email with gmail.com', () {
      String email = 'suthar@gmail.com';
      final result = EditTextValidation.emailValidator(email);
      expect(result, null);
    });

    test('valid email with custom domain', () {
      String email = 'suthar@marwadtech.com';
      final result = EditTextValidation.emailValidator(email);
      expect(result, null);
    });

    test('missing @ in email', () {
      String email = 'suthar.com';
      final result = EditTextValidation.emailValidator(email);
      expect(result, 'email format is invalid');
    });

    test('missing . in email', (){
      String email = 'suthar@gmailcom';
      final result = EditTextValidation.emailValidator(email);
      expect(result, 'email format is invalid');
    });

    test('email without extension .com, .co', (){
      String email = 'sut.har@gmailcom';
      final result = EditTextValidation.emailValidator(email);
      expect(result, 'email format is invalid');
    });

    test('missing @ and domain name in email', (){
      String email = 'suthar';
      final result = EditTextValidation.emailValidator(email);
      expect(result, 'email format is invalid');
    });

    test('missing domain name in email', (){
      String email = 'suthar@';
      final result = EditTextValidation.emailValidator(email);
      expect(result, 'email format is invalid');
    });

    test('email is not valid format', (){
      String email = 'suthar@gml.com';
      final result = EditTextValidation.emailValidator(email);
      expect(result, 'gmail spelling is wrong');
    });
  });

  group('address validator', (){
    test('address is empty', (){
      String address = '';
      final result = EditTextValidation.addressValidator(address);
      expect(result, null);
    });

    test('address min char', (){
      String address = 'ti';
      final result = EditTextValidation.addressValidator(address);
      expect(result, "Address must be at least 3 characters long");
    });

    test('valid address', (){
      String address = 'Timber market, Vishvakarma cross road, sumerpur, pali, rajasthan (306902)';
      final result = EditTextValidation.addressValidator(address);
      expect(result, null);
    });
  });

  group('password validator', (){
    test('password is empty', (){
      String password = '';
      final result = EditTextValidation.passwordValidator(password);
      expect(result, null);
    });

    test('password less than 8 char', (){
      String password = 'marwa12';
      final result = EditTextValidation.passwordValidator(password);
      expect(result, "Password must be at least 8 characters long");
    });

    test('valid password', (){
      String password = 'marwa123';
      final result = EditTextValidation.passwordValidator(password);
      expect(result, null);
    });
  });

  group('confirm password validator', (){
    test('confirm password is empty', (){
      String password = 'marwa123';
      String confirmPassword = '';
      final result = EditTextValidation.confirmPasswordValidator(confirmPassword, password);
      expect(result, null);
    });

    test('confirm password not match', (){
      String password = 'marwa123';
      String confirmPassword = 'marwa12';
      final result = EditTextValidation.confirmPasswordValidator(confirmPassword, password);
      expect(result, "Confirm Password does not match");
    });

    test('valid confirm password', (){
      String password = 'marwa123';
      String confirmPassword = 'marwa123';
      final result = EditTextValidation.confirmPasswordValidator(confirmPassword, password);
      expect(result, null);
    });
  });
}