class AppValidator {
  static String? validateName({String? name}) {
    if (name == null || name.trim().isEmpty) {
      return 'Name is required';
    }
    if (name.length < 3) {
      return 'Name must be at least 3 characters';
    }
    return null;
  }

  static String? validateEmail({String? email}) {
    if (email == null || email.trim().isEmpty) {
      return 'Email is required';
    }
    final bool emailValid = RegExp(
      r"^[a-zA-Z0-9.a-zA-Z0-9.!#$%&'*+-/=?^_`{|}~]+@[a-zA-Z0-9]+\.[a-zA-Z]+",
    ).hasMatch(email);
    if (!emailValid) {
      return 'Enter a valid email address';
    }
    return null;
  }

  static String? validatePassword({String? password}) {
    if (password == null || password.trim().isEmpty) {
      return 'Password is required';
    }
    if (password.length < 6) {
      return 'Password must be at least 6 characters';
    }
    return null;
  }

  static String? validateConfirmPassword({
    String? password,
    String? confirmPassword,
  }) {
    if (confirmPassword == null || confirmPassword.trim().isEmpty) {
      return 'Please confirm your password';
    }
    if (confirmPassword != password) {
      return 'Passwords do not match';
    }
    return null;
  }

  static String? validatePhone({String? phoneNumber}) {
    if (phoneNumber == null || phoneNumber.trim().isEmpty) {
      return 'Phone number is required';
    }
    final bool phoneNumberValid = RegExp(
      r"^(?:[+0]9)?[0-9]{11}$",
    ).hasMatch(phoneNumber);
    if (!phoneNumberValid) {
      return 'Enter a valid phone number';
    }
    return null;
  }
}
