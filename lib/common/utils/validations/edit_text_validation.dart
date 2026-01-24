class EditTextValidation {
  static bool userNameValidation(String username){
    if(username.isNotEmpty && username.length >=3 && !username.contains(RegExp(r'[!@#\$&*~]'))){
      return true;
    }
    return false;
  }

  static bool emailValidation(String email){
    if(email.isNotEmpty && RegExp(r'^[\w-\.]+@([\w-]+\.)+[\w-]{2,4}$').hasMatch(email)){
      return true;
    }
    return false;
  }

  static bool addressValidation(String address){
    if(address.isNotEmpty && address.length >=3){
      return true;
    }
    return false;
  }

  static bool passwordValidation(String password){
    if(password.isNotEmpty && password.length >=8){
      return true;
    }
    return false;
  }

  static bool confirmPasswordValidation(String password, String confirmPassword){
    if(confirmPassword.isNotEmpty && password == confirmPassword){
      return true;
    }
    return false;
  }

  static String? nameValidator(String? value) {
    if(value == null || value.isEmpty) {
      return null;
    } else if(value.length < 3) {
      return "Name must be at least 3 characters long";
    }
    return null;
  }

  static String? confirmPasswordValidator(String? confirmPassword, String? password) {
    if(confirmPassword == null || confirmPassword.isEmpty) {
      return null;
    } else if(confirmPassword != password) {
      return "Confirm Password does not match";
    }
    return null;
  }

  static String? passwordValidator(String? value) {
    if(value == null || value.isEmpty) {
      return null;
    } else if(value.length < 8) {
      return "Password must be at least 8 characters long";
    }
    return null;
  }

  static String? addressValidator(String? value) {
    if(value == null || value.isEmpty) {
      return null;
    } else if(value.length < 3) {
      return "Address must be at least 3 characters long";
    }
    return null;
  }

  static String? emailValidator(String? value) {
    final email = (value ?? "").trim();

    if (email.isEmpty) return null;

    final emailRegex =
    RegExp(r'^[a-zA-Z0-9._%+-]+@[a-zA-Z0-9.-]+\.[a-zA-Z]{2,}$');

    if (!emailRegex.hasMatch(email)) {
      return "email format is invalid";
    }

    final domain = email.split("@").last.toLowerCase();

    // ✅ detect gmail spelling mistakes
    final wrongGmailDomains = {
      "gma.com",
      "gmial.com",
      "gamil.com",
      "gmai.com",
      "gmal.com",
      "gmail.co", // optional
      "gmail.con", // optional
      "gnail.com",
      "gmail.cm",
      "gmaill.com",
      "gmail.cmo",
      "gml.com",
      "gmaol.com",
      "gmail.lom",
      "gmail.om",
      "gmil.com",
      "gmi.com"
    };

    if (wrongGmailDomains.contains(domain)) {
      return "gmail spelling is wrong";
    }

    return null;
  }



}