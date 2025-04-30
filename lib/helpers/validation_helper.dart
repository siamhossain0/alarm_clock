class ValidationHelper {
  static bool isValidEmail(String email) {
    final emailRegExp = RegExp(
      r'^[a-zA-Z0-9.]+@[a-zA-Z0-9]+\.[a-zA-Z]+',
    );
    return emailRegExp.hasMatch(email);
  }
  static bool isValidPassword(String password) {
    final passwordRegExp = RegExp(
      r'^(?=.*[A-Za-z])(?=.*\d)[A-Za-z\d]{8,}$',
    );
    return passwordRegExp.hasMatch(password);
  }

  static bool isValidPhone(String phone) {
    final phoneRegExp = RegExp(
      r'^\+?[0-9]{10,15}$',
    );
    return phoneRegExp.hasMatch(phone);
  }

  static bool isNullOrEmpty(String? str) {
    return str == null || str.trim().isEmpty;
  }

  static bool hasMinLength(String str, int minLength) {
    return str.length >= minLength;
  }

  static bool hasMaxLength(String str, int maxLength) {
    return str.length <= maxLength;
  }

  static bool isInRange(num value, num min, num max) {
    return value >= min && value <= max;
  }
}