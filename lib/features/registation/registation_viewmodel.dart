import 'package:flutter/cupertino.dart';
import 'package:mymovieapp/Auth/Auth_service.dart';
import 'package:mymovieapp/common/validators/email_validator.dart';
import 'package:mymovieapp/common/validators/password_validator.dart';

class RegistationViewModel {
  TextEditingController nameController = TextEditingController();
  TextEditingController emailController = TextEditingController();
  TextEditingController passwordF1Controller = TextEditingController();
  TextEditingController passwordF2Controller = TextEditingController();

  ValueNotifier<bool> obsecureText1 = ValueNotifier(true);
  ValueNotifier<bool> obsecureText2 = ValueNotifier(true);
  ValueNotifier<String?> errorSnackbarMsg = ValueNotifier(null);

  AuthService authService = AuthService.getInstance();

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

  bool isAllFieldEntered() {
    return (nameController.text.isEmpty ||
        emailController.text.isEmpty ||
        passwordF1Controller.text.isEmpty ||
        passwordF2Controller.text.isEmpty);
  }

  void onClickedSignUp() async {
    final user = await authService.createNewUser(
        emailController.text, passwordF1Controller.text);

    if (isAllFieldEntered()) {
      errorSnackbarMsg.value = "Fields can't be empty";
      return;
    }

    if (!PasswordValidator.isValid(passwordF1Controller.text)) {
      return;
    }

    if (!PasswordValidator.isSame(
        passwordF1Controller.text, passwordF2Controller.text)) {
      errorSnackbarMsg.value = "Password must be same";
      return;
    }

    if (user == null) {
      emailController.text = '';
      nameController.text = '';
      passwordF1Controller.text = '';
      passwordF2Controller.text = '';
    }
  }
}
