import 'package:flutter_svg/svg.dart';
import 'package:paint_shop/app/import.dart';
import 'package:paint_shop/utils/app.container.dart';

class WithDrawaHistory extends StatelessWidget {
  const WithDrawaHistory({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: AppContainer(
        child: Column(
          children: [
            Row(
              children: [
                InkWell(
                  onTap: () {
                    context.pop();
                  },
                  child: Container(
                    height: 24.h,
                    width: 34.w,

                    child: SvgPicture.asset(
                      AppImage.backImg,

                      height: 15.h,
                      width: 18.w,
                    ),
                  ),
                ),
                Gap(4.w),
                AppText(
                  title: AppString.TransactionHistory,
                  color: Colors.black,
                  fontWeight: FontWeight.w500,
                  fontSize: 18.sp,
                ),
              ],
            ),
            AppText(
              title: "10,000",
              color: Colors.black,
              fontWeight: FontWeight.w600,
              fontSize: 28.sp,
            ),
            AppText(
              title: AppString.AvailableBalance,
              color: Colors.black,
              fontWeight: FontWeight.w500,
              fontSize: 14.sp,
            ),
            SizedBox(height: 16.h),

            SizedBox(height: 16.h),
            ListTile(
              leading: Container(
                height: 48.h,
                width: 48.w,
                padding: EdgeInsets.all(10),

                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(32),
                  color: Colors.white,
                ),
                child: Image.asset(
                  AppImage.paint,
                  height: 20.h,
                  width: 20.w,
                  fit: BoxFit.cover,
                ),
              ),
              title: AppText(
                title: "Interior Paint",
                fontWeight: FontWeight.w500,
                fontSize: 14.sp,
              ),
              subtitle: AppText(
                title: "944353",
                fontWeight: FontWeight.w400,
                fontSize: 10.sp,
              ),
              trailing: Row(
                mainAxisSize: MainAxisSize.min,
                children: [
                  Image.asset(AppImage.dollar, height: 20.h, width: 20.w),
                  SizedBox(width: 4.w),
                  AppText(
                    title: "5000",
                    fontSize: 14.sp,
                    fontWeight: FontWeight.w500,
                  ),
                ],
              ),
            ),
            ListTile(
              leading: Container(
                height: 48.h,
                width: 48.w,
                padding: EdgeInsets.all(10),

                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(32),
                  color: Colors.white,
                ),
                child: Image.asset(
                  AppImage.paint,
                  height: 20.h,
                  width: 20.w,
                  fit: BoxFit.cover,
                ),
              ),
              title: AppText(
                title: "Interior Paint",
                fontWeight: FontWeight.w500,
                fontSize: 14.sp,
              ),
              subtitle: AppText(
                title: "944353",
                fontWeight: FontWeight.w400,
                fontSize: 10.sp,
              ),
              trailing: Row(
                mainAxisSize: MainAxisSize.min,
                children: [
                  Image.asset(AppImage.dollar, height: 20.h, width: 20.w),
                  SizedBox(width: 4.w),
                  AppText(
                    title: "5000",
                    fontSize: 14.sp,
                    fontWeight: FontWeight.w500,
                  ),
                ],
              ),
            ),
            ListTile(
              leading: Container(
                height: 48.h,
                width: 48.w,
                padding: EdgeInsets.all(10),

                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(32),
                  color: Colors.white,
                ),
                child: Image.asset(
                  AppImage.paint,
                  height: 20.h,
                  width: 20.w,
                  fit: BoxFit.cover,
                ),
              ),
              title: AppText(
                title: "Interior Paint",
                fontWeight: FontWeight.w500,
                fontSize: 14.sp,
              ),
              subtitle: AppText(
                title: "944353",
                fontWeight: FontWeight.w400,
                fontSize: 10.sp,
              ),
              trailing: Row(
                mainAxisSize: MainAxisSize.min,
                children: [
                  Image.asset(AppImage.dollar, height: 20.h, width: 20.w),
                  SizedBox(width: 4.w),
                  AppText(
                    title: "5000",
                    color: Colors.red,
                    fontSize: 14.sp,
                    fontWeight: FontWeight.w500,
                  ),
                ],
              ),
            ),
            ListTile(
              leading: Container(
                height: 48.h,
                width: 48.w,
                padding: EdgeInsets.all(10),

                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(32),
                  color: Colors.white,
                ),
                child: Image.asset(
                  AppImage.paint,
                  height: 20.h,
                  width: 20.w,
                  fit: BoxFit.cover,
                ),
              ),
              title: AppText(
                title: "Interior Paint",
                fontWeight: FontWeight.w500,
                fontSize: 14.sp,
              ),
              subtitle: AppText(
                title: "944353",
                fontWeight: FontWeight.w400,
                fontSize: 10.sp,
              ),
              trailing: Row(
                mainAxisSize: MainAxisSize.min,
                children: [
                  Image.asset(AppImage.dollar, height: 20.h, width: 20.w),
                  SizedBox(width: 4.w),
                  AppText(
                    title: "5000",
                    fontSize: 14.sp,
                    color: Colors.red,
                    fontWeight: FontWeight.w500,
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
