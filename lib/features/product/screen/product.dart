import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:paint_shop/core/constants/color_constant.dart';
import 'package:paint_shop/core/constants/text_constant.dart';
import 'package:paint_shop/features/product/screen/show_bottom.dart';
import 'package:paint_shop/features/product/widget/item.dart';
import 'package:paint_shop/utils/app_text_filed.dart' show AppTextField;

class ProductScreen extends StatelessWidget {
  const ProductScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        gradient: LinearGradient(
          end: Alignment.topCenter,
          begin: Alignment.bottomCenter,
          colors: [Colors.white, AppColors.appColor],
        ),
      ),
      padding: const EdgeInsets.only(top: 60),
      child: Column(
        children: [
          // Header
          Padding(
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
                InkWell(
                  onTap: () {
                    showFilterBottomSheet(context);
                  },
                  child: Container(
                    height: 40.h,
                    width: 40.w,
                    margin: EdgeInsets.only(left: 10.w),
                    decoration: BoxDecoration(
                      image: const DecorationImage(
                        image: AssetImage("assets/images/Frame.png"),
                      ),
                      shape: BoxShape.circle,
                      color: Colors.white,
                    ),
                  ),
                ),
              ],
            ),
          ),

          // Scrollable Grid
          Expanded(
            child: Padding(
              padding: const EdgeInsets.symmetric(horizontal: 16),
              child: GridView.builder(
                itemCount: 20,
                gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                  crossAxisCount: 2,
                  mainAxisSpacing: 12,
                  crossAxisSpacing: 12,
                  childAspectRatio: 0.8,
                ),
                itemBuilder: (context, index) {
                  return ProductCard();
                },
              ),
            ),
          ),
        ],
      ),
    );
  }
}
