class PasswordValidator {
  static RegExp characterRegex = RegExp(r'[a-zA-Z]');
  static RegExp numberRegex = RegExp(r'[0-9]');
  static RegExp specialCharacterRegex = RegExp(r'[!@#\$%^&*(),.?":{}|<>_]');
  static bool passwordIsRight = true;

  static isValid(String password) {
    if (passwordErrorMessage(password) == null && password.isNotEmpty) {
      return true;
    }
    if (password.isEmpty) return false;
  }

  static passwordErrorMessage(String password) {
    if (password.isEmpty) {
      return null;
    }
    if (password.length < 8) {
      return "Password must be at least 8 characters long";
    }
    if (!characterRegex.hasMatch(password)) {
      return "Password must contain a character";
    }
    if (!numberRegex.hasMatch(password)) {
      return "Password must contain a number";
    }
    if (!specialCharacterRegex.hasMatch(password)) {
      return "Password must contain a special character";
    }
  }

  static isSame(String password1, String password2) {
    if (password1 == password2) {
      return true;
    } else {
      return false;
    }
  }
}
