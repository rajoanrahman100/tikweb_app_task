import 'package:flutter/material.dart';
import 'package:tikwebapptask/components/color_config.dart';

class TextFieldWidget extends StatelessWidget {
  final String? hintText;
  final TextEditingController? controller;
  final Widget? suffixWidget;
  final TextInputType? inputType;
  final bool? isSuffix;

  TextFieldWidget({this.hintText, this.controller, this.suffixWidget, this.inputType, this.isSuffix});

  @override
  Widget build(BuildContext context) {
    return TextFormField(
      controller: controller,
      cursorColor: Colors.black.withOpacity(0.4),
      keyboardType: inputType ?? TextInputType.text,
      decoration: new InputDecoration(
          border: InputBorder.none,
          fillColor: kGreyColor.withOpacity(0.2),
          filled: true,
          focusedBorder: OutlineInputBorder(
            borderSide: BorderSide(color: Colors.transparent),
            borderRadius: BorderRadius.circular(5),
          ),
          enabledBorder: OutlineInputBorder(
            borderSide: BorderSide(color: Colors.transparent),
            borderRadius: BorderRadius.circular(5),
          ),
          errorBorder: OutlineInputBorder(
            borderSide: BorderSide(color: Colors.red),
            borderRadius: BorderRadius.circular(5),
          ),
          suffixIcon: isSuffix == true ? suffixWidget : null,

          disabledBorder: InputBorder.none,
          contentPadding: EdgeInsets.only(left: 15, bottom: 11, top: 11, right: 15),
          hintText: hintText),
    );
  }
}