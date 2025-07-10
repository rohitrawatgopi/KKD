import 'package:flutter/material.dart';
import 'package:paint_shop/core/constants/color_constant.dart';

class AppText extends StatelessWidget {
  final String title;
  final double fontSize;
  final double? letterSpacing;
  final FontWeight fontWeight;
  final Color? color;
  final TextAlign? textAlign;
  final TextOverflow? textOverflow;
  final TextDecoration? textDecoration;
  final FontStyle? fontStyle;
  final int? maxLine;
  final double? height;
  const AppText({
    super.key,
    required this.title,
    this.color,
    this.height,
    this.maxLine,
    this.letterSpacing,
    this.textAlign,
    this.textOverflow,
    this.textDecoration,
    this.fontSize = 14,
    this.fontWeight = FontWeight.w400,
    this.fontStyle,
  });

  @override
  Widget build(BuildContext context) {
    return Text(
      title,
      textAlign: textAlign,

      maxLines: maxLine,
      style: TextStyle(
        height: height,

        color: color,
        letterSpacing: letterSpacing,
        fontSize: fontSize,
        fontWeight: fontWeight,

        overflow: textOverflow,
        fontFamily: 'SF Pro',

        decoration: textDecoration,
        fontStyle: fontStyle,
      ),
    );
  }
}

class ReqAppText extends StatelessWidget {
  final String title;
  final String title2;
  final double? height;
  final String? title3;
  final String? title4;
  final double fontSize;
  final FontWeight fontWeight;
  final FontWeight? fontWeight2;
  final Color? color1;
  final Color? color2;

  final TextAlign? textAlign;
  final TextOverflow? textOverflow;
  final TextDecoration? textDecoration;
  const ReqAppText({
    super.key,
    required this.title,
    this.fontWeight2,
    this.title4,
    required this.title2,
    this.title3,
    this.color1,
    this.height,
    this.color2,
    this.textAlign,

    this.textOverflow,
    this.textDecoration,
    this.fontSize = 14,
    this.fontWeight = FontWeight.w400,
  });

  @override
  Widget build(BuildContext context) {
    return RichText(
      textAlign: textAlign ?? TextAlign.center,
      text: TextSpan(
        text: title,
        style: TextStyle(
          color: color1 ?? AppColors.textColor,
          fontSize: fontSize,
          fontFamily: 'SF Pro Display',
          fontWeight: fontWeight,
          height: height,
          // ...
        ),

        children: [
          TextSpan(
            text: title2,
            style: TextStyle(
              fontSize: fontSize,
              fontWeight: fontWeight2,
              color: color2 ?? AppColors.textLightColor,
              fontFamily: 'SF Pro Display',
            ),
          ),
          TextSpan(
            text: title3,
            style: TextStyle(
              height: height,
              fontSize: fontSize,
              fontWeight: fontWeight,
              color: color2 ?? AppColors.textLightColor,
              fontFamily: 'SF Pro Display',
            ),
          ),
          TextSpan(
            text: title4,
            style: TextStyle(
              height: height,
              fontSize: fontSize,
              fontWeight: fontWeight2,
              color: color2 ?? AppColors.textLightColor,
              fontFamily: 'SF Pro Display',
            ),
          ),
        ],
      ),
    );
  }
}
