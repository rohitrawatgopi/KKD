import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:paint_shop/core/constants/color_constant.dart';
import 'package:paint_shop/utils/app_text.dart';

class WithDrawButton extends StatelessWidget {
  final String btName;
  VoidCallback onTab;
  final Color? bgColor;
  final Color? textColor;
  WithDrawButton({
    super.key,
    required this.btName,
    required this.onTab,
    this.bgColor,
    this.textColor,
  });

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: onTab,
      child: Container(
        width: 133.5.h,
        height: 40.w,

        padding: EdgeInsets.symmetric(vertical: 10.h, horizontal: 16.w),
        decoration: BoxDecoration(
          color: bgColor ?? Colors.transparent,
          borderRadius: BorderRadius.circular(12.r),
          border: Border.all(color: Colors.black, width: 1.w),
        ),

        child: Center(
          child: AppText(
            title: btName,
            color: textColor ?? AppColors.textColor,
            fontSize: 14.sp,
            height: 1.5,
            letterSpacing: -1,
            fontWeight: FontWeight.w400,
          ),
        ),
      ),
    );
  }
}
