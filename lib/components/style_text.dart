import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:tikwebapptask/components/color_config.dart';

Text textRoboto(String title, Color color,
    {double? fontSize, FontWeight? fontWeight,int? maxLine,TextDecoration? textDecoration}) {
  return Text(
    title,
    style: GoogleFonts.roboto(
        color: color, fontWeight: fontWeight, fontSize: fontSize,decoration: textDecoration),
    maxLines: maxLine?? 1,
    overflow: TextOverflow.ellipsis,
    softWrap: false,
  );
}

BoxDecoration containerBoxDecoration({double? borderRadius,Color? color,List<BoxShadow>? boxShadow}){
  return BoxDecoration(
    borderRadius:BorderRadius.circular(borderRadius!),
    color: color,
    boxShadow: boxShadow,
  );
}


showSnackBar({BuildContext? context, String? message}){

  return ScaffoldMessenger.of(context!).showSnackBar(SnackBar(
    backgroundColor: kBlackColor,
    duration: Duration(seconds: 2),
    content: textRoboto(message!,kWhiteColor,fontWeight: weight500,maxLine: 2),
  )
  );

}

const FontWeight weight500=FontWeight.w500;
const FontWeight weight400=FontWeight.w400;
const FontWeight weightBold=FontWeight.bold;

const CrossAxisAlignment crossAxisAlignmentCenter = CrossAxisAlignment.center;
const CrossAxisAlignment crossAxisAlignmentStart = CrossAxisAlignment.start;

MainAxisAlignment mainAxisAlignmentCenter = MainAxisAlignment.center;
MainAxisAlignment mainAxisAlignmentBetween = MainAxisAlignment.spaceBetween;
MainAxisAlignment mainAxisAlignmentAround = MainAxisAlignment.spaceAround;