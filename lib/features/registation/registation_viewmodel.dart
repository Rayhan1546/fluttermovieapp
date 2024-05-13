import 'package:flutter/cupertino.dart';
import 'package:mymovieapp/common/validators/email_validator.dart';
import 'package:mymovieapp/common/validators/password_validator.dart';

class RegistationViewModel {
  TextEditingController nameController = TextEditingController();
  TextEditingController emailController = TextEditingController();
  TextEditingController passwordF1Controller = TextEditingController();
  TextEditingController passwordF2Controller = TextEditingController();

  ValueNotifier<bool> obsecureText1 = ValueNotifier(true);
  ValueNotifier<bool> obsecureText2 = ValueNotifier(true);
  ValueNotifier<bool> shouldSignUp = ValueNotifier(false);

  void showPasswordF1() {
    obsecureText1.value = !obsecureText1.value;
  }

  void showPasswordF2() {
    obsecureText2.value = !obsecureText2.value;
  }

  String? emailError() {
    return EmailValidator.emailErrorMessage(emailController.text);
  }

  String? passwordErrorF1() {
    return PasswordValidator.passwordErrorMessage(passwordF1Controller.text);
  }

  String? passwordErrorF2() {
    return PasswordValidator.passwordErrorMessage(passwordF2Controller.text);
  }

  String? signUpValidation() {
    if (nameController.text.isEmpty ||
        emailController.text.isEmpty ||
        passwordF1Controller.text.isEmpty ||
        passwordF2Controller.text.isEmpty) {
      return "Fields can't be empty";
    } else if (PasswordValidator.isValid(passwordF1Controller.text) == true &&
        PasswordValidator.isValid(passwordF2Controller.text) == true) {
      if (PasswordValidator.isSame(
          passwordF1Controller.text, passwordF2Controller.text)) {
        shouldSignUp.value = true;
      } else {
        return "Passwords must be same!";
      }
    }
  }
}
