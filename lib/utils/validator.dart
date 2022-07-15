class Validator {
  static String? validateEmail(String value) {
    const Pattern pattern = r'^[a-zA-Z0-9.]+@[a-zA-Z0-9]+\.[a-zA-Z]+';
    final RegExp regex = RegExp(pattern as String);
    if (!regex.hasMatch(value)) {
      return '🚩 Please enter a valid email address.';
    } else {
      return null;
    }
  }

  static String? validateDropDefaultData(value) {
    if (value == null) {
      return 'Please select an item.';
    } else {
      return null;
    }
  }

  static String? validatePassword(String value) {
    const Pattern pattern = r'^.{6,}$';
    final RegExp regex = RegExp(pattern as String);
    if (!regex.hasMatch(value)) {
      return '🚩 Password must be at least 6 characters.';
    } else {
      return null;
    }
  }

  static String? validateName(String value) {
    if (value.length < 3) {
      return '🚩 Username is too short.';
    } else {
      return null;
    }
  }

  static String? validateText(String value) {
    if (value.isEmpty) {
      return '🚩 Text is too short.';
    } else {
      return null;
    }
  }

  static String? validatePhoneNumber(String value) {
    if (value.length != 11) {
      return '🚩 Phone number is not valid.';
    } else {
      return null;
    }
  }
}
