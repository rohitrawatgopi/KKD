import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:paint_shop/utils/app_text.dart' show AppText;
import 'package:paint_shop/utils/image_constant.dart' show AppImage;

class ProductCard extends StatelessWidget {
  const ProductCard({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 204.h,
      width: 164.w,
      padding: EdgeInsets.symmetric(horizontal: 8.w),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(8.r),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Align(
            alignment: Alignment.center,
            child: Image.asset(AppImage.paint),
          ),
          AppText(
            title: "Birla Opus Style Perfect Start Primer",
            letterSpacing: 1.2.w,
            fontSize: 12.sp,
          ),
          AppText(title: "944353"),
        ],
      ),
    );
  }
}
