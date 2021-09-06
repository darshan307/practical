import 'package:astro/presentation/themes/color_constants.dart';
import 'package:flutter/material.dart';

class TextStyleConstants {
  static const String _fontFamily = 'OpenSans';

  static const TextStyle titleTextStyle = TextStyle(
    fontSize: 20,
    color: ColorConstants.black,
    fontWeight: FontWeight.w700,
    fontFamily: _fontFamily,
  );

    static const TextStyle titleRegularTextStyle = TextStyle(
    fontSize: 20,
    color: ColorConstants.black,
    fontWeight: FontWeight.w400,
    fontFamily: _fontFamily,
  );


  static const TextStyle titleWhiteTextStyle = TextStyle(
    fontSize: 20,
    color: ColorConstants.white,
    fontWeight: FontWeight.w400,
    fontFamily: _fontFamily,
  );

  static const TextStyle hintTextStyle = TextStyle(
    fontSize: 20,
    color: ColorConstants.grey,
    fontWeight: FontWeight.w400,
    fontFamily: _fontFamily,
  );

  static const TextStyle subtitleTextStyle = TextStyle(
    fontSize: 14,
    color: ColorConstants.grey,
    fontWeight: FontWeight.w400,
    fontFamily: _fontFamily,
  );
}
