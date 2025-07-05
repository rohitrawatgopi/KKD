import 'package:paint_shop/app/import.dart';

class UploadDocumnetScreen extends StatelessWidget {
  final String UploadScreenName;
  const UploadDocumnetScreen({super.key, required this.UploadScreenName});

  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.infinity,
      decoration: BoxDecoration(
        gradient: LinearGradient(
          end: Alignment.topCenter,
          begin: Alignment.bottomCenter,
          colors: [Colors.white, AppColors.appColor],
        ),
      ),
      padding: EdgeInsets.only(top: 64.h, left: 18.w, right: 18.w),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          AppText(
            title: AppString.secureYourAccount,
            fontWeight: FontWeight.w500,
            fontSize: 20.sp,
          ),
          Gap(5.h),
          AppText(
            title: AppString.uploadYourBankPassbook,
            fontSize: 14.sp,
            fontWeight: FontWeight.w500,
          ),
          Gap(5.h),
          Container(
            height: 150.h,
            width: 341.w,
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(4),
              color: AppColors.appWhite,
            ),
            padding: EdgeInsets.symmetric(horizontal: 12, vertical: 10),
            child: Center(
              child: Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Icon(Icons.add),
                  AppText(
                    title: AppString.uploadImage,
                    fontWeight: FontWeight.w400,
                    fontSize: 14.sp,
                  ),
                ],
              ),
            ),
          ),
          Gap(8.h),
          AppText(
            title: AppString.OnlyJPGPNGorPDF,
            fontWeight: FontWeight.w400,
            fontSize: 14.sp,
          ),
          Gap(20.h),
          AppButton(
            width: 341.w,
            hight: 40.h,
            radius: 12.w,
            onPressed: () {},

            title: AppString.save,
            fontSize: 14.sp,
            fontWeight: FontWeight.w400,
            color: AppColors.buttonColor,
          ),
        ],
      ),
    );
  }
}
