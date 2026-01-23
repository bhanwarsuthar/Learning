class EditTextValidation {
  bool userNameValidation(String username){
    if(username.isNotEmpty && username.length >=3 && !username.contains(RegExp(r'[!@#\$&*~]'))){
      return true;
    }
    return false;
  }

  bool emailValidation(String email){
    if(email.isNotEmpty && RegExp(r'^[\w-\.]+@([\w-]+\.)+[\w-]{2,4}$').hasMatch(email)){
      return true;
    }
    return false;
  }

  bool addressValidation(String address){
    if(address.isNotEmpty && address.length >=3){
      return true;
    }
    return false;
  }

  bool passwordValidation(String password){
    if(password.isNotEmpty && password.length >=8){
      return true;
    }
    return false;
  }

  bool confirmPasswordValidation(String password, String confirmPassword){
    if(confirmPassword.isNotEmpty && password == confirmPassword){
      return true;
    }
    return false;
  }
}