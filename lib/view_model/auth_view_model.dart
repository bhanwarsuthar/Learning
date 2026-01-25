import 'package:flutter/foundation.dart';
import 'package:learning/common/utils/validations/edit_text_validation.dart';
import 'package:learning/repositories/auth_repository.dart';

class AuthViewModel with ChangeNotifier {
  final AuthRepository authRepo;

  AuthViewModel({required this.authRepo});

  bool _loading = false;
  bool get loading => _loading;
  setLoading(bool value) {
    _loading = value;
    notifyListeners();
  }

  bool _registerButtonEnabled = false;
  bool get registerButtonEnabled => _registerButtonEnabled;
  setRegisterButtonEnabled(bool value) {
    _registerButtonEnabled = value;
    notifyListeners();
  }

  String _name = '';
  String get name => _name;
  setName(String value) {
    _name = value;
    hasAllValidInputs();
  }

  String _email = '';
  String get email => _email;
  setEmail(String value) {
    _email = value;
    hasAllValidInputs();
  }

  String _address = '';
  String get address => _address;
  setAddress(String value) {
    _address = value;
    hasAllValidInputs();
  }

  String _password = '';
  String get password => _password;
  setPassword(String value) {
    _password = value;
    hasAllValidInputs();
  }

  String _confirmPassword = '';
  String get confirmPassword => _confirmPassword;
  setConfirmPassword(String value) {
    _confirmPassword = value;
    hasAllValidInputs();
  }

  bool _privacyPolicyAccept = false;
  bool get privacyPolicyAccept => _privacyPolicyAccept;
  setPrivacyPolicyAccept(bool value) {
    _privacyPolicyAccept = value;
    hasAllValidInputs();
  }




  Future<void> registerApi(dynamic data) async {

      setLoading(true);
      await authRepo
          .registerApi(data)
          .then((value) {
            setLoading(false);
            if (kDebugMode) {
              print('Register Response: $value');
            }
          })
          .onError((error, stackTrace) {
            setLoading(false);
            if (kDebugMode) {
              print('Register Error: $error');
            }
          });
  }

  void hasAllValidInputs() {
    setRegisterButtonEnabled(EditTextValidation.userNameValidation(_name) &&
        EditTextValidation.emailValidation(_email) &&
        EditTextValidation.addressValidation(_address) &&
        EditTextValidation.passwordValidation(_password) &&
        EditTextValidation.confirmPasswordValidation(
            _password, _confirmPassword) &&
        _privacyPolicyAccept);
  }
}
