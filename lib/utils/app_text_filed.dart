import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

class AppTextField extends StatelessWidget {
  final double? width;
  final double? height;

  final Widget? iconData;
  final Widget? leadingIcon;
  final String? labelText;
  final TextStyle? labelStyle;
  final TextStyle? style;
  final bool readOnly;
  final Color? borderColor;
  final TextEditingController? controller;
  final Function()? onTap;
  final String? hintText;
  final void Function(String value)? onChanged;
  final String? Function(String?)? validator;
  final String? initialValue;
  final bool obscureText;
  final FocusNode? focusNode;
  final int? maxLength;
  final int? maxLines;
  final String? counterText;
  final FontWeight? fontWeight;
  final double? fontSize;
  final Widget? prefixIcon;
  final TextInputType? keyBoardType;
  final bool? enabled;
  final void Function(String)? onFieldSubmitted;
  final EdgeInsetsGeometry contentPadding;
  final String obscuringCharacter;
  final TextAlign textAlign;
  final String? prefixText;
  final TextStyle? hintStyle;
  final Color? bgColor;
  final Color? textColor;
  final TextCapitalization? textCapitalization;
  final double borderRadius;
  final bool? isCollapsed;

  const AppTextField({
    super.key,
    this.labelText,
    this.isCollapsed,
    this.width = 1,
    this.fontWeight,
    this.iconData,
    this.controller,
    this.onTap,
    this.readOnly = false,
    this.height,
    this.hintText,
    this.onChanged,
    this.hintStyle,
    this.bgColor = Colors.white,
    this.prefixIcon,
    this.leadingIcon,
    this.textCapitalization,
    this.initialValue,
    this.style = const TextStyle(),
    this.validator,
    this.fontSize = 14,
    this.obscureText = false,
    this.focusNode,
    this.keyBoardType,
    this.enabled = true,
    this.textAlign = TextAlign.start,
    this.onFieldSubmitted,
    this.maxLines,
    this.borderColor,
    this.labelStyle,
    this.maxLength,
    this.prefixText,
    this.counterText,
    this.obscuringCharacter = '•',
    this.borderRadius = 30,
    this.contentPadding = const EdgeInsets.symmetric(
      vertical: 14,
      horizontal: 12,
    ),
    this.textColor,
  });

  @override
  Widget build(BuildContext context) {
    double w = MediaQuery.of(context).size.width;
    return Container(
      height: height,
      width: w * width!,
      decoration: BoxDecoration(
        color: bgColor,
        //  borderRadius: BorderRadius.circular(borderRadius),
      ),
      child: TextFormField(
        textInputAction:
            TextInputAction.newline, // 🛠️ Move to next line on enter
        textCapitalization: textCapitalization ?? TextCapitalization.none,
        onFieldSubmitted: onFieldSubmitted,
        inputFormatters: [FilteringTextInputFormatter.deny(RegExp(r'^\s'))],
        enabled: enabled,
        focusNode: focusNode,
        initialValue: initialValue,
        validator: validator,
        onChanged: onChanged,
        readOnly: readOnly,
        obscureText: obscureText,
        onTap: onTap,
        textAlign: textAlign,
        keyboardType: keyBoardType,
        controller: controller,
        autovalidateMode: AutovalidateMode.onUserInteraction,
        maxLength: maxLength,
        maxLines: maxLines,
        enableSuggestions: true,
        style: TextStyle(
          fontSize: fontSize,
          color: textColor,
          fontWeight: fontWeight,
        ),
        obscuringCharacter: obscuringCharacter,
        decoration: InputDecoration(
          prefixIcon: prefixIcon,
          isCollapsed: isCollapsed,
          counterText: '',
          prefix: leadingIcon,
          prefixText: prefixText,
          filled: readOnly,
          hintText: hintText,
          hintStyle: hintStyle,
          suffixIcon: iconData,
          labelText: labelText == '' ? null : labelText,
          contentPadding: contentPadding,
          alignLabelWithHint: true,
          labelStyle: labelStyle,

          // FIXED: Properly Apply Rounded Borders
          border: OutlineInputBorder(
            // borderRadius: BorderRadius.circular(borderRadius),
            borderSide: BorderSide.none,
          ),
          enabledBorder: OutlineInputBorder(
            //   borderRadius: BorderRadius.circular(borderRadius),
            borderSide: BorderSide.none,
          ),
          focusedBorder: OutlineInputBorder(
            borderRadius: BorderRadius.circular(borderRadius),
            borderSide: BorderSide.none,
          ),
        ),
      ),
    );
  }
}
