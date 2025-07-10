import 'package:paint_shop/app/import.dart';

class ProductCard extends StatelessWidget {
  const ProductCard({super.key});

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        Container(
          height: 204.h,
          width: 164.w,
          padding: EdgeInsets.symmetric(vertical: 8.r),
          decoration: BoxDecoration(
            // border: Border.all(color: Colors.black),
            color: Colors.white,
            borderRadius: BorderRadius.circular(8.r),
          ),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.center,

            children: [
              Image.asset(AppImage.paint, width: 114.w, height: 128.h),
              Container(
                height: 44.h,
                width: 164.w,
                padding: EdgeInsets.symmetric(horizontal: 8.w),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  mainAxisAlignment: MainAxisAlignment.start,
                  children: [
                    AppText(
                      height: 1,
                      title: "Birla Opus Style Perfect Start Primer",
                      letterSpacing: 0.2,
                      fontWeight: FontWeight.w500,
                      fontSize: 12.sp,
                    ),

                    Gap(7.h),
                    AppText(
                      height: 1,
                      title: "944353",
                      fontSize: 10.sp,

                      letterSpacing: 0,

                      fontWeight: FontWeight.w400,
                    ),
                  ],
                ),
              ),
            ],
          ),
        ),

        Positioned(
          right: 14.w,
          top: 7.h,
          child: Container(
            padding: EdgeInsets.symmetric(horizontal: 6.w, vertical: 4.h),
            height: 32.h,
            width: 62.w,
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(10.r),

              color: AppColors.cardStackColor,
            ),

            child: Row(
              children: [
                Image.asset(AppImage.dollar),
                AppText(
                  title: "500",
                  fontSize: 12.sp,
                  fontWeight: FontWeight.w500,
                ),
              ],
            ),
          ),
        ),
      ],
    );
  }
}
