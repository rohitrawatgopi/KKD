import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:gap/gap.dart';
import 'package:paint_shop/core/constants/image_constant.dart';
import 'package:paint_shop/core/constants/text_constant.dart';
import 'package:paint_shop/core/model/user.model.dart';
import 'package:paint_shop/utils/app_text.dart';

class CustomKkdCard extends StatelessWidget {
  final UserModel user;

  const CustomKkdCard({super.key, required this.user});

  @override
  Widget build(BuildContext context) {
    return Container(
      width: 343.w,
      height: 183.h,
      padding: EdgeInsets.symmetric(horizontal: 16.w, vertical: 24.h),
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(16.r),
        image: DecorationImage(
          image: AssetImage(AppImage.kkdCardImg),

          fit: BoxFit.cover,
        ),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              AppText(
                title: AppString.TOTALCOINS,
                fontSize: 12.sp,
                height: 1,
                fontWeight: FontWeight.w500,
              ),
              AppText(
                title: AppString.KKDCard,
                fontSize: 12.sp,
                fontWeight: FontWeight.w400,
                height: 1,
              ),
            ],
          ),
          Gap(5.w),

          Row(
            children: [
              Image.asset(
                AppImage.dollar,
                height: 24.h,
                width: 24.w,
                fit: BoxFit.cover,
              ),
              Gap(5.w),
              AppText(
                title: user.coinsEarned.toString(),
                height: 1.1,
                fontSize: 24.sp,
                fontWeight: FontWeight.w600,
              ),
            ],
          ),
          Gap(10.h),

          AppText(
            title: user.userId.toString(),
            fontSize: 24.sp,
            fontWeight: FontWeight.w600,
            height: .8,
          ),
          Gap(5.h),
          AppText(
            title: user.fullName.toString(),
            fontSize: 14.sp,
            height: 1,
            fontWeight: FontWeight.w500,
          ),

          Gap(8.h),

          AppText(
            title: "View Details",
            fontSize: 12.sp,
            height: 1,
            color: Colors.black,
            fontWeight: FontWeight.w400,
          ),
        ],
      ),
    );
  }
}
