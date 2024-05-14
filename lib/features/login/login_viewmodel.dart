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
  ValueNotifier<String?> errorSnackbarMsg = ValueNotifier(null);

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

  void onClickSignIn() {
    if (isAllFieldEntered()) {
      errorSnackbarMsg.value = "Fields can't be empty";
      return;
    }

    if (!EmailValidator.isValid(emailcontroller.text) &&
        !PasswordValidator.isValid(passcontroller.text)) {
      return;
    }

    if (emailcontroller.text == 'mahmudrayhan256@gmail.com' &&
        passcontroller.text == '123456a#') {
      shouldNavigate.value = true;
      return;
    }

    errorSnackbarMsg.value = "Please enter the correct username or password";
  }
}
