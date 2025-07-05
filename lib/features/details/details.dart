import 'package:paint_shop/app/import.dart';

class RewardDetailsScreen extends StatelessWidget {
  const RewardDetailsScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return AnnotatedRegion(
      value: SystemUiOverlayStyle(statusBarColor: Colors.transparent),
      child: Scaffold(
        appBar: AppBar(
          title: AppText(
            title: AppString.ProductDetails,
            fontSize: 18.sp,
            fontWeight: FontWeight.w500,
          ),
        ),
        body: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Image.asset(AppImage.paint, height: 208, width: 370),
            Container(
              padding: EdgeInsets.symmetric(horizontal: 16),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  AppText(
                    title: AppString.HyundaiCreta,
                    fontSize: 18.sp,
                    fontWeight: FontWeight.w500,
                  ),
                  AppText(
                    title: AppString.HyundaiCretaversion,
                    fontSize: 14.sp,
                    fontWeight: FontWeight.w400,
                  ),
                  AppText(
                    title: AppString.HyundaiCretapetro,
                    fontSize: 14.sp,
                    fontWeight: FontWeight.w400,
                  ),
                  ReqAppText(
                    fontSize: 16.sp,
                    fontWeight: FontWeight.w500,

                    title: AppString.PurchasingPoints,
                    title2: "2,50,000",
                    color2: AppColors.priceGreen,
                  ),
                  Gap(60.h),
                  AppButton(
                    color: AppColors.buttonColor,
                    onPressed: () {},
                    title: AppString.Redeem,
                    fontSize: 14,
                    fontWeight: FontWeight.w400,
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
