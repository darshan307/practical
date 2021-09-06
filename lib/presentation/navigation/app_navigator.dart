import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class AppNavigator {
  static Future<dynamic> navigateTo(
      {required BuildContext context,
      required Widget widget,
      bool? isReplace = false}) async {
    if (isReplace ?? false) {
      return await Navigator.pushReplacement(
          context, MaterialPageRoute(builder: (context) => widget));
    } else {
      return await Navigator.push(
          context, MaterialPageRoute(builder: (context) => widget));
    }
  }
}
