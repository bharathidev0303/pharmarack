import 'dart:io';

import 'package:flutter/cupertino.dart';
import 'package:pharmarack/packages/core_flutter/localization/localization_extensions.dart';

class OnboardingValidators {
  /// Generic for any value so error message is required
  String? validateNotNullOrEmpty(String? value, String errorMessage) {
    if (value == null || value.trim().isEmpty) {
      return errorMessage;
    }
    return null;
  }

  String? validateNotNullOrEmptyOrSpaces(String? value, String errorMessage) {
    if (value == null ||
        value.trim().isEmpty ||
        value.contains(RegExp(r"^\s* " ""))) {
      return errorMessage;
    }
    return null;
  }

  /// Generic for any value so error message is required
  String? validateLength(
      String? value, String errorMessage, int length, String lengthErrorMsg) {
    if (value == null || value.trim().isEmpty) {
      return errorMessage;
    }

    if (value.isNotEmpty && value.trim().length < length) {
      return lengthErrorMsg;
    }
    return null;
  }

  String? validateLengthAndSpace(
      String? value, String errorMessage, int length, String lengthErrorMsg) {
    if (value == null ||
        value.trim().isEmpty ||
        value.contains(RegExp(r"^\s* " ""))) {
      return errorMessage;
    }

    if (value.isNotEmpty && value.trim().length < length) {
      return lengthErrorMsg;
    }
    return null;
  }

  /// Only for validating mobile number so returning string from function
  String? validateMobileNumber(String? value, BuildContext context) {
    if (value == null || !RegExp(r'^\d{10}$').hasMatch(value)) {
      return context.localizedString.mobileNumLengthError;
    }

    // Check if the first digit is not 0, 1, 2, 3, or 4
    if ('01234'.contains(value[0])) {
      return context.localizedString.mobileNumInvalidStartDigit;
    }

    // Check if all digits are the same
    if (RegExp(r'^(.)\1*$').hasMatch(value)) {
      return context.localizedString.mobileNumberSameDigitError;
    }

    // If all conditions are met, the mobile number is valid
    return null;
  }

  /// Only for validating email so returning string from function
  String? validateEmail(String? value, BuildContext context) {
    final emailRegex = RegExp(r'^[\w-]+(\.[\w-]+)*@([\w-]+\.)+[a-zA-Z]{2,7}$');
    if (!emailRegex.hasMatch(value ?? '')) {
      return context.localizedString.emailError;
    }
    return null;
  }

  /// Only for validating GST number so returning string from function
  String? validateGstNumber(String? value, BuildContext context) {
    final emailRegex =
        RegExp(r'^\d{2}[A-Z]{5}\d{4}[A-Z]{1}[A-Z\d]{1}[Z]{1}[A-Z\d]{1}$');

    if (!emailRegex.hasMatch(value ?? '')) {
      return context.localizedString.gstError;
    }

    return null;
  }

  /// Only for validating PAN number so returning string from function
  String? validatePanNumber(String? value, BuildContext context) {
    RegExp regExp = RegExp(r"^[A-Z]{5}[0-9]{4}[A-Z]{1}$");

    if (value == null || value.length < 6 || !regExp.hasMatch(value)) {
      return context.localizedString.panError;
    }
    return null;
  }

  /// only for checkbox which compulsory need to be checked
  String? validateCheckboxChecked(bool? checked, errorMessage) {
    if (!(checked ?? false)) {
      return errorMessage;
    }
    return null;
  }

  /// Validate file form field
  String? validateImageFormField(File? file, errorMessage) {
    if (file == null) {
      return errorMessage;
    }
    return null;
  }
}
