import 'package:flutter/cupertino.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:mymovieapp/common/validators/email_validator.dart';
import 'package:mymovieapp/common/validators/password_validator.dart';

class LoginViewModel {
  TextEditingController emailcontroller = TextEditingController();
  TextEditingController passcontroller = TextEditingController();

  ValueNotifier<bool> obsecuretext = ValueNotifier(true);
  ValueNotifier<bool> shouldNavigate = ValueNotifier(false);

  void obsecureiconclick() {
    obsecuretext.value = !obsecuretext.value;
  }

  String? getEmailError() {
    return EmailValidator.emailErrorMessage(emailcontroller.text);
  }

  String? getPasswordError() {
    return PasswordValidator.passwordErrorMessage(passcontroller.text);
  }

  String? signInvalidation() {
    if (EmailValidator.isValid(emailcontroller.text) == true &&
        PasswordValidator.isValid(passcontroller.text) == true) {
      if (emailcontroller.text == 'mahmudrayhan256@gmail.com' &&
          passcontroller.text == '123456a#') {
        shouldNavigate.value = true;
      }
    }
    if (EmailValidator.isValid(emailcontroller.text) == false)
      return "Email cant be empty";
    if (EmailValidator.isValid(passcontroller.text) == false)
      return "Password cant be empty";
    return 'Please enter a correct email or password';
  }
}
