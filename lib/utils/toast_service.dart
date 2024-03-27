import 'package:collaborating_editing_app/utils/app_exception.dart';
import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';

class ToastService {
  static void showError(dynamic message) {
    Fluttertoast.showToast(
      msg: handleErroMsg(message),
      toastLength: Toast.LENGTH_SHORT,
      gravity: ToastGravity.BOTTOM,
      backgroundColor: Colors.red,
      textColor: Colors.white,
    );
  }

  static void showSuccess(String message) {
    Fluttertoast.showToast(
      msg:  handleErroMsg(message),
      toastLength: Toast.LENGTH_SHORT,
      gravity: ToastGravity.BOTTOM,
      backgroundColor: Colors.green,
      textColor: Colors.white,
    );
  }

  static void showWarning(String message) {
    Fluttertoast.showToast(
      msg:  handleErroMsg(message),
      toastLength: Toast.LENGTH_SHORT,
      gravity: ToastGravity.BOTTOM,
      backgroundColor: Colors.yellow,
      textColor: Colors.black,
    );
  }

 static String handleErroMsg(dynamic value) {
    late String errorMsg;
    value is AppException ? errorMsg = value.message! : errorMsg = value;
    return errorMsg;
  }
}
