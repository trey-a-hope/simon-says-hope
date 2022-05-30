import 'package:get/get_state_manager/get_state_manager.dart';

import '../constants/globals.dart';

class ValidationService extends GetxService {
  String? isEmpty(String? value) {
    if (value == null || value.length == 0) {
      return ('Field cannot be empty.');
    } else {
      return null;
    }
  }

  String? minChars(String? value) {
    return (value == null || value
        .replaceAll(' ', '')
        .length < Globals.CREATE_FEELING_CHAR_LIMIT)
        ? 'Must enter at least ${Globals.CREATE_FEELING_CHAR_LIMIT} characters.'
        : null;
  }

  String? mobile(String? value) {
    String patttern = r'(^(?:[+0]9)?[0-9]{10,12}$)';
    RegExp regExp = RegExp(patttern);
    if (value == null || value.length == 0) {
      return null;
    } else if (!regExp.hasMatch(value)) {
      return 'Enter valid number or leave blank.';
    }
    return null;
  }

  String? email(String? value) {
    String pattern =
        r'^(([^<>()[\]\\.,;:\s@\"]+(\.[^<>()[\]\\.,;:\s@\"]+)*)|(\".+\"))@((\[[0-9]{1,3}\.[0-9]{1,3}\.[0-9]{1,3}\.[0-9]{1,3}\])|(([a-zA-Z\-0-9]+\.)+[a-zA-Z]{2,}))$';
    RegExp regex = RegExp(pattern);
    if (value == null || !regex.hasMatch(value))
      return 'Enter a valid email.';
    else
      return null;
  }

  String? password(String? value) {
    String pattern = '.{6,}';
    RegExp regex = RegExp(pattern);
    if (value == null || !regex.hasMatch(value))
      return 'Enter 6 characters minimum.';
    else
      return null;
  }

  String? state(String? value) {
    if (value == null || value.isEmpty) return 'Invalid state.';
    final RegExp regExp = RegExp(r'^[a-zA-Z]{2}$');
    if (!regExp.hasMatch(value)) return 'Must be 2 letters.';
    return null;
  }

  String? zip(String? value) {
    if (value == null || value.isEmpty) return 'Invalid zip.';
    final RegExp regExp = RegExp(r'^[0-9]{5}$');
    if (!regExp.hasMatch(value)) return 'Must be 5 digits.';
    return null;
  }

  String? cardNumber(String? value) {
    if (value == null || value.isEmpty) return 'Invalid card number.';
    final RegExp regExp = RegExp(r'^[0-9]{16}$');
    if (!regExp.hasMatch(value)) return 'Must be 16 numbers.';
    return null;
  }

  String? cardExpiration(String? value) {
    if (value == null || value.isEmpty) return 'Invalid expiration.';
    final RegExp regExp = RegExp(r'^[0-9]{4}$');
    if (!regExp.hasMatch(value)) return 'Must be 4 numbers.';
    return null;
  }

  String? cardCVC(String? value) {
    if (value == null || value.isEmpty) return 'Invalid CVC.';
    final RegExp regExp = RegExp(r'^[0-9]{3}$');
    if (!regExp.hasMatch(value)) return 'Must be 3 numbers.';
    return null;
  }
}
