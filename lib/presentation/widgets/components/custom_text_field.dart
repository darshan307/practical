import 'package:astro/presentation/themes/color_constants.dart';
import 'package:flutter/material.dart';

class CustomTextField extends StatelessWidget {
  final TextEditingController textEditingController;
  final String hintText;
  final Widget? prefixWidget;
  const CustomTextField(
      {Key? key,
      required this.textEditingController,
      required this.hintText,
      this.prefixWidget})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.symmetric(horizontal: 16, vertical: 4),
      decoration: BoxDecoration(
        color: ColorConstants.lightGrey,
        borderRadius: BorderRadius.circular(36),
      ),
      child: TextField(
        controller: textEditingController,
        decoration: InputDecoration(
          icon: prefixWidget,
          hintText: hintText,
          hintStyle: TextStyle(color: ColorConstants.black),
          border: InputBorder.none,
        ),
      ),
    );
  }
}
