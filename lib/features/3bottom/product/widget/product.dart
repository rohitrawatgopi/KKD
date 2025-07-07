import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:paint_shop/core/constants/text_constant.dart' show AppString;
import 'package:paint_shop/utils/app_text.dart' show AppText;
import 'package:paint_shop/utils/app_text_filed.dart';
import 'package:paint_shop/utils/image_constant.dart' show AppImage;

class ProductWidget {
  static Widget itemWidget = Container(
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
        Align(alignment: Alignment.center, child: Image.asset(AppImage.paint)),
        AppText(
          title: "Birla Opus Style Perfect Start Primer",
          letterSpacing: 1.2.w,
          fontSize: 12.sp,
        ),
        AppText(title: "944353"),
      ],
    ),
  );

  static Widget headWidget = Padding(
    padding: EdgeInsets.symmetric(horizontal: 16.w),
    child: Row(
      children: [
        Container(
          height: 40.h,
          width: 287.w,
          padding: EdgeInsets.fromLTRB(15.w, 11.h, 10.w, 11.h),
          decoration: BoxDecoration(
            color: Colors.white,
            borderRadius: BorderRadius.circular(36),
          ),
          child: Row(
            children: [
              Icon(Icons.search, size: 20.w),
              Expanded(
                child: AppTextField(
                  hintText: AppString.Search,
                  textAlign: TextAlign.justify,
                ),
              ),
            ],
          ),
        ),
        Container(
          height: 40.h,
          width: 40.w,
          margin: EdgeInsets.only(left: 10.w),
          decoration: BoxDecoration(
            image: DecorationImage(image: AssetImage(AppImage.FrameImg)),
            shape: BoxShape.circle,
            color: Colors.white,
          ),
        ),
      ],
    ),
  );
}
