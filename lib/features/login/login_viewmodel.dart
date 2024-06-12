import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:mymovieapp/Auth/Auth_service.dart';
import 'package:mymovieapp/common/validators/email_validator.dart';
import 'package:mymovieapp/common/validators/password_validator.dart';

class LoginViewModel {
  TextEditingController emailcontroller = TextEditingController();
  TextEditingController passcontroller = TextEditingController();

  ValueNotifier<bool> obsecuretext = ValueNotifier(true);
  ValueNotifier<bool> shouldNavigate = ValueNotifier(false);

  AuthService authService = AuthService.getInstance();

  void obsecureiconclick() {
    obsecuretext.value = !obsecuretext.value;
  }

  String? getEmailError() {
    return EmailValidator.emailErrorMessage(emailcontroller.text);
  }

  String? getPasswordError() {
    return PasswordValidator.passwordErrorMessage(passcontroller.text);
  }

  bool isAllFieldEntered() {
    return (emailcontroller.text.isEmpty || passcontroller.text.isEmpty);
  }

  Future<String?> onClickSignIn() async {
    final user = await authService.loginWithEmail(
        emailcontroller.text, passcontroller.text);

    if (isAllFieldEntered()) {
      return "Fields can't be empty";
    }

    if (!EmailValidator.isValid(emailcontroller.text) &&
        !PasswordValidator.isValid(passcontroller.text)) {
      return "Email and Password isn't correct";
    }

    if (user == null) {
      return "Please enter the correct username or password";
    }

    shouldNavigate.value = true;
    return "Success";
  }
}
