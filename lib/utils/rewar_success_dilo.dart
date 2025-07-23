import 'package:paint_shop/app/import.dart';

class QrScarrenWidget {
  // ignore: non_constant_identifier_names
  static Widget SuccesCoinAlertDilogBox({required context, required conin}) {
    return Container(
      height: 331.h,
      width: 317.w,
      padding: EdgeInsets.symmetric(horizontal: 24.w, vertical: 32.h),
      decoration: BoxDecoration(borderRadius: BorderRadius.circular(32.r)),
      child: Stack(
        children: [
          Positioned(
            top: -15,
            right: -5,
            child: IconButton(
              onPressed: () {
                Navigator.of(context).pop();
              },
              icon: Icon(Icons.close, size: 30.w),
            ),
          ),
          Column(
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: [
              Gap(30.h),
              AppText(
                textAlign: TextAlign.center,
                title: AppString.congratulations,
                fontWeight: FontWeight.w500,
                height: 1,
                fontSize: 24.sp,
              ),
              const SizedBox(height: 24),
              Image.asset(
                AppImage.dollar,
                height: 100.h,
                width: 100.w,
                fit: BoxFit.contain,
              ),
              const SizedBox(height: 14),
              AppText(
                textAlign: TextAlign.center,
                title: conin + " coins",
                fontWeight: FontWeight.w700,
                fontSize: 24.sp,
                height: 1,
              ),
              Gap(15.h),
              AppText(
                title: AppString.haveBeenAddedToWallet,
                fontWeight: FontWeight.w500,
                fontSize: 14.sp,
                height: 1,
                textAlign: TextAlign.center,
              ),
            ],
          ),
        ],
      ),
    );
  }
}
