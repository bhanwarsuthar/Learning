import 'package:flutter/foundation.dart';
import 'package:learning/common/utils/validations/edit_text_validation.dart';
import 'package:learning/repository/auth_repository.dart';

class AuthViewModel with ChangeNotifier {
  final _authRepo = AuthRepository();
  final _validation = EditTextValidation();

  bool _loading = false;

  bool get loading => _loading;

  setLoading(bool value) {
    _loading = value;
    notifyListeners();
  }

  Future<void> registerApi(dynamic data) async {
    try {
      setLoading(true);
      await _authRepo
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
    } catch (e) {
      rethrow;
    }
  }

  bool validation(
    String name,
    String email,
    String address,
    String password,
    String confirmPassword,
    bool privacyPolicyAccepted,
  ) {
    return (_validation.userNameValidation(name) &&
        _validation.emailValidation(email) &&
        _validation.addressValidation(address) &&
        _validation.passwordValidation(password) &&
        _validation.confirmPasswordValidation(password, confirmPassword) &&
        privacyPolicyAccepted);
  }
}
