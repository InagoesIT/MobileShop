import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';

class ToastShower{
  static void showError(String message) {
  Fluttertoast.showToast(
    msg: message,
    toastLength: Toast.LENGTH_SHORT, 
    gravity: ToastGravity.BOTTOM, 
    timeInSecForIosWeb: 1, 
    backgroundColor: Colors.red[300], 
    textColor: Colors.white,
    fontSize: 16.0,
  );
}
}