import 'package:flutter/material.dart';
import 'package:tikwebapptask/components/color_config.dart';
import 'package:tikwebapptask/components/style_text.dart';

class ButtonWidget extends StatelessWidget {
  const ButtonWidget({
    Key? key,
    required this.size,
    this.btnColor,
    this.btnText,
    this.textColor,
    this.callback,
  }) : super(key: key);

  final Size size;
  final Color? btnColor;
  final String? btnText;
  final Color? textColor;
  final VoidCallback? callback;

  @override
  Widget build(BuildContext context) {
    return Container(
      width: size.width,
      child: MaterialButton(
        height: 45,
        color:btnColor??kBlackColor,
        shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(10.0)
        ),
        onPressed: callback,
        child: textRoboto("${btnText??"Login"}", textColor??kWhiteColor,fontSize: 18,fontWeight: weight500),
      ),
    );
  }
}
