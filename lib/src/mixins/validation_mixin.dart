class ValidationMixin {
  // function to validate email
  String? validateEmail(value) {
    if (value.isEmpty) {
      return 'Please enter some text';
    }
    if (!value.contains('@')) {
      //  return null if void otherwise (string with the error.message) if invalid
      return 'Please enter a valid email';
    }

    return null;
  }

  // function to validate password
  String? validatePassword(value) {
    if (value == null) {
      return "Please enter a password";
    }
    if (value.length < 4) {
      return 'Password must be at least 4 characters';
    }
    return null;
  }
}
