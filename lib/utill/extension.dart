// Email Validation Extension
extension EmailValidation on String {
  // Regular expression for validating email format
  static final RegExp _emailRegex = RegExp(
      r'^[a-zA-Z0-9._%+-]+@[a-zA-Z0-9.-]+\.[a-zA-Z]{2,}$');

  // Method to validate email
  bool get isValidEmail {
    return _emailRegex.hasMatch(this);
  }
}