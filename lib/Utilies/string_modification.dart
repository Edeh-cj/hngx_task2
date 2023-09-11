extension Formvalidinput on String{
  bool get isValidEmail{
    final emailRegExp = RegExp(r"^[a-zA-Z0-9.]+@[a-zA-Z0-9]+\.[a-zA-Z]+");
    if (isNotEmpty) {
      return emailRegExp.hasMatch(this);
    } else {
      return false;
    }
  }

  bool get isValidPassword{
    final passwordRegExp = 
    RegExp(r'^(?=.*?[A-Z])(?=.*?[a-z])(?=.*?[0-9])(?=.*?[!@#\><*~]).{8,}/pre>');
    if (isNotEmpty) {
      return passwordRegExp.hasMatch(this);
    } else {
      return false;
    }
  }

  bool get isValidPhonenumber{
    final phoneRegExp = RegExp(r"^\+?0[0-9]{10}$");
    if (isNotEmpty) {
      return phoneRegExp.hasMatch(this);
    } else {
      return false;
    }
  }
}