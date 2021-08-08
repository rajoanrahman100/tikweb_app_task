import 'package:flutter/material.dart';
import 'package:tikwebapptask/components/color_config.dart';

class TextFieldWidget extends StatelessWidget {
  final String? hintText;
  final TextEditingController? controller;
  final Widget? suffixWidget;
  final Widget? prefixWidget;
  final TextInputType? inputType;
  final bool? isSuffix;
  final String? type;
   bool? isObsecure;
  bool? isPrefix;

  TextFieldWidget({this.hintText, this.controller, this.suffixWidget,this.prefixWidget,
    this.inputType, this.isSuffix,this.type,this.isObsecure=false,this.isPrefix=false});

  @override
  Widget build(BuildContext context) {
    return TextFormField(
      controller: controller,
      cursorColor: Colors.black.withOpacity(0.4),
      keyboardType: inputType ?? TextInputType.text,
      obscureText: isObsecure??true,
      validator: (String? value){
        if(value==null || value.trim().length==0){
          return "Field is required";
        }if(type=="password"){
          if(value.trim().length>20 || value.trim().length<8){
            return "Password length should between 8-20 characters";
          }

        }if(type=="email"){
          if(!RegExp(r"^[a-zA-Z0-9.!#$%&'*+/=?^_`{|}~-]+@[a-zA-Z0-9](?:[a-zA-Z0-9-]"
          r"{0,253}[a-zA-Z0-9])?(?:\"
          r".[a-zA-Z0-9](?:[a-zA-Z0-9-]{0,253}[a-zA-Z0-9])?)*")
              .hasMatch(value)){
            return "Enter valid email";
          }
        }
        return null;
      },
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
          prefixIcon: isPrefix==true?prefixWidget:null,
          disabledBorder: InputBorder.none,
          contentPadding: EdgeInsets.only(left: 15, bottom: 11, top: 11, right: 15),
          hintText: hintText),
    );
  }
}
