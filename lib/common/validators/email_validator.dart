class EmailValidator {
  static RegExp emailRegex = RegExp(r'^[\w-\.]+@([\w-]+\.)+[\w-]{2,4}$');

  static isValid(String mail) {
    if (emailErrorMessage(mail) == null && mail.isNotEmpty) return true;
    if(mail.isEmpty) return false;
  }

  static emailErrorMessage(String mail) {
    if (mail.isEmpty) {
      return null;
    }
    if (!emailRegex.hasMatch(mail)) {
      return "Please enter the correct mail address";
    }
    return null;
  }
}
