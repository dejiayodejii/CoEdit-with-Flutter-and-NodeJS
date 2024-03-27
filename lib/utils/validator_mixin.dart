mixin ValidatorMixin {
  String? validateNotEmpty(String? value) =>
      value != null && value.isEmpty ? 'Field cannot be empty' : null;

  String? validateAge(String? value) {
    // value != null && value.isEmpty ? 'Field cannot be empty' : null;
    if (value != null) {
      final result = int.parse(value);
      if (result >= 5 && result <= 17) {
        return null;
      } else {
        return 'age must be between 5 and 17';
      }
    } else {
      return 'age cannot be empty';
    }
  }

  String? validateFullName(String? value) =>
      value != null && value.split(' ').length < 2
          ? 'Enter a valid Full Name'
          : null;

  String? validateEmail(String? value) {
    if (value == null) return 'Please enter an email address';

    bool emailValid = RegExp(
            r"^[a-zA-Z0-9.a-zA-Z0-9.!#$%&'*+-/=?^_`{|}~]+@[a-zA-Z0-9]+\.[a-zA-Z]+")
        .hasMatch(value);
    return !emailValid ? 'Enter a Valid Email Address' : null;
  }

  String? validateNotNullEmail(String? value) {
    if (value == null) return 'Please enter an email address';

    bool emailValid = RegExp(
            r"^[a-zA-Z0-9.a-zA-Z0-9.!#$%&'*+-/=?^_`{|}~]+@[a-zA-Z0-9]+\.[a-zA-Z]+")
        .hasMatch(value);
    return value.isEmpty
        ? null
        : !emailValid
            ? 'Enter a Valid Email Address'
            : null;
  }

  String? validatePhoneNumber(String? value) =>
      value != null && value.length != 11 ? 'incorrect phone number' : null;

  String? validatePassword(String? value) {
    RegExp regex = RegExp(r'^(?=.*?[a-zA-Z])(?=.*?[0-9])(?=.*?[^\w\s]).{8,}$');
    if (value == null) {
      return 'Please enter password';
    } else {
      if (!regex.hasMatch(value)) {
        return 'At least 8 characters, alphanumeric and a symbol';
      } else {
        return null;
      }
    }
  }

  String? validateConfirmPassword(String? value, String? password) =>
      value != null && value != password ? 'Passwords do not match' : null;

  String? validateOtp(String? value) =>
      value != null && value.length == 6 ? null : 'Invalid code';

  String? validateGender(String? value) => value != null && value == 'Gender'
      ? 'Choose one of male or female'
      : null;

  String? validateBvn(String? value) {
    if (value == null || value.length != 11) return 'Enter a Valid BVN';
    bool emailValid = RegExp(r"\b(?<!\.)\d+(?!\.)\b").hasMatch(value);
    return !emailValid ? 'Enter a Valid BVN' : null;
  }

  String? validateAcctNo(String? value) {
    if (value == null || value.length != 10) {
      return 'Enter a Valid Account Number';
    }
    bool emailValid = RegExp(r"\b(?<!\.)\d+(?!\.)\b").hasMatch(value);
    return !emailValid ? 'Enter a Valid Account Number' : null;
  }
}
