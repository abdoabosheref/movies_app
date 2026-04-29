class AppValidator {
  static String? validateName(String? text) {
    if (text == null || text.isEmpty) {
      return 'Name is required';
    }
    if (text.length < 3) {
      return 'Name must be at least 3 characters';
    }
    return null;
  }

  static String? validateEmail(String? text) {
    if (text == null || text.isEmpty) {
      return 'Email is required';
    }
    final emailRegExp = RegExp(r"^[a-zA-Z0-9.]+@[a-zA-Z0-9]+\.[a-zA-Z]+");
    if (!emailRegExp.hasMatch(text)) {
      return 'Enter a valid email address';
    }
    return null;
  }

  static String? validatePassword(String? text) {
    if (text == null || text.isEmpty) {
      return 'Password is required';
    }
    if (text.length < 6) {
      return 'Password must be at least 6 characters';
    }
    return null;
  }

  static String? validateConfirmPassword(String? text, String passwordText) {
    if (text == null || text.isEmpty) {
      return 'Please confirm your password';
    }
    if (text != passwordText) {
      return 'Passwords do not match';
    }
    return null;
  }

  static String? validatePhone(String? text) {
    if (text == null || text.isEmpty) {
      return 'Phone number is required';
    }
    if (!RegExp(r'^[0-9]+$').hasMatch(text)) {
      return 'Enter digits only';
    }
    if (text.length < 10) {
      return 'Enter a valid phone number';
    }
    return null;
  }
}
