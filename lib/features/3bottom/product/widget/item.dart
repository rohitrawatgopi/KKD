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
          padding: EdgeInsets.symmetric(vertical: 8.h),
          decoration: BoxDecoration(
            border: Border.all(color: Colors.black),
            color: Colors.white,
            borderRadius: BorderRadius.circular(8.r),
          ),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Align(
                alignment: Alignment.center,
                child: Image.asset(AppImage.paint, height: 128.h, width: 114.w),
              ),
              Container(
                padding: EdgeInsets.symmetric(horizontal: 8.w),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    AppText(
                      title: "Birla Opus Style Perfect Start Primer",
                      letterSpacing: 1.2.w,
                      fontSize: 12.sp,
                    ),
                    AppText(title: "944353"),
                  ],
                ),
              ),
            ],
          ),
        ),

        Positioned(
          right: 14,
          top: 7,
          child: Container(
            padding: EdgeInsets.symmetric(horizontal: 6, vertical: 4),
            height: 32.h,
            width: 62.w,
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(10),

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
