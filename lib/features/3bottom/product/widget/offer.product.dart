import 'package:paint_shop/app/import.dart';

class OfferProductCard extends StatelessWidget {
  const OfferProductCard({super.key});

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        Container(
          height: 191.h,
          width: 164.w,
          padding: EdgeInsets.symmetric(vertical: 8.r),
          decoration: BoxDecoration(
            color: Colors.white,
            borderRadius: BorderRadius.circular(8.r),
          ),
          child: Column(
            spacing: 4.h,

            crossAxisAlignment: CrossAxisAlignment.center,

            children: [
              Image.asset(
                AppImage.car,
                width: 148.w,
                height: 123.h,
                fit: BoxFit.cover,
              ),
              Container(
                height: 48.h,
                width: 164.w,
                padding: EdgeInsets.symmetric(horizontal: 8.w),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  mainAxisAlignment: MainAxisAlignment.start,
                  children: [
                    AppText(
                      height: 1.4,
                      title: AppString.HyundaiCreta,
                      letterSpacing: 0,
                      fontWeight: FontWeight.w500,
                      fontSize: 14.sp,
                    ),

                    AppText(
                      height: 1.2,
                      title: AppString.HyundaiCretaversion,
                      fontSize: 10.sp,

                      fontWeight: FontWeight.w400,
                    ),
                  ],
                ),
              ),
            ],
          ),
        ),

        // Positioned(
        //   right: 14.w,
        //   top: 7.h,
        //   child: Container(
        //     padding: EdgeInsets.symmetric(horizontal: 6.w, vertical: 4.h),
        //     height: 32.h,
        //     width: 62.w,
        //     decoration: BoxDecoration(
        //       borderRadius: BorderRadius.circular(10.r),

        //       color: AppColors.cardStackColor,
        //     ),

        //     child: Row(
        //       children: [
        //         Image.asset(AppImage.dollar),
        //         AppText(
        //           title: "500",
        //           fontSize: 12.sp,
        //           fontWeight: FontWeight.w500,
        //         ),
        //       ],
        //     ),
        //   ),
        // ),
      ],
    );
  }
}
