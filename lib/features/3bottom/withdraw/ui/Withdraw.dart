import 'package:paint_shop/app/import.dart';
import 'package:paint_shop/features/3bottom/withdraw/widget/button.dart';
import 'package:paint_shop/utils/alert_dilog.dart';
import 'package:paint_shop/utils/app.container.dart';
import 'package:paint_shop/utils/app_text_filed.dart';
import 'package:paint_shop/utils/rewar_success_dilo.dart';

class WithdrawScreen extends StatelessWidget {
  const WithdrawScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: AppContainer(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Padding(
              padding: EdgeInsets.symmetric(horizontal: 16.w),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  AppText(
                    title: AppString.withdraw,
                    height: 1.6,
                    letterSpacing: -1,
                    fontSize: 18.sp,
                    fontWeight: FontWeight.w500,
                  ),
                  InkWell(
                    onTap: () {
                      context.push("/trasnactionhistory");
                    },
                    child: Container(
                      height: 44.h,
                      width: 44.w,
                      padding: EdgeInsets.all(10.w),
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(20.r),

                        color: Colors.white,
                      ),
                      child: Image.asset(
                        AppImage.withdraw,
                        width: 18.w,
                        height: 16.h,
                      ),
                    ),
                  ),
                ],
              ),
            ),
            AppText(
              textAlign: TextAlign.center,
              title: "10,000",
              fontSize: 28.sp,
              height: 1,
              letterSpacing: -0.5,
              fontWeight: FontWeight.w600,
            ),
            Gap(6.h),
            AppText(
              title: AppString.AvailableBalance,
              fontSize: 14.sp,
              height: 1,
              letterSpacing: 0.2,
              fontWeight: FontWeight.w500,
            ),
            Gap(26.h),
            AppText(
              title: AppString.Yourwithdrawalrequestisencryptedandsecure,
              fontSize: 12.sp,
              fontWeight: FontWeight.w400,
              height: 1,
              letterSpacing: -0.2,
              textAlign: TextAlign.center,
            ),
            Gap(16.h),

            Container(
              padding: EdgeInsets.symmetric(horizontal: 24.w, vertical: 32.h),
              height: 267.h,
              width: 327.w,
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(24.r),
                gradient: LinearGradient(
                  colors: [
                    Color.fromRGBO(209, 231, 253, 1),
                    Color.fromRGBO(215, 228, 183, 0.5),
                  ],
                ),
              ),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  AppText(
                    title: AppString.youCanWithdrawUpToBalance,
                    fontSize: 14.sp,
                    letterSpacing: -0.2,
                    fontWeight: FontWeight.w400,
                    height: 1,
                  ),
                  Gap(12.h),
                  AppText(
                    title: AppString.amountWithdraw,
                    fontWeight: FontWeight.w500,
                    fontSize: 14.sp,
                    letterSpacing: -0.2,
                    height: 1,
                  ),
                  Gap(4.h),
                  AppTextField(
                    height: 40.h,
                    width: 279.w,
                    maxLines: 1,
                    textSpace: -0.2,
                    keyBoardType: TextInputType.number,
                    hintText: AppString.EnterAmounttoWithdraw,
                    fontWeight: FontWeight.w500,
                    fontSize: 14.sp,
                    textHeight: 1,
                  ),
                  Gap(6.h),
                  Gap(6.h),
                  Align(
                    alignment: Alignment.bottomRight,
                    child: AppText(
                      title: "Min: 15,000",

                      fontWeight: FontWeight.w500,
                      fontSize: 12.sp,
                      letterSpacing: 0.2,
                    ),
                  ),
                  Gap(8.h),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      WithDrawButton(
                        btName: AppString.clean,
                        onTab: () {
                          SuccesCoinAlertDilogBox(
                            context: context,
                            conin: "5,000 coins",
                          );
                        },
                      ),
                      WithDrawButton(
                        textColor: AppColors.appWhite,
                        bgColor: AppColors.textLightColor,
                        btName: AppString.request,
                        onTab: () {
                          WrongAlertDilogBox(
                            context: context,
                            userName: "Rohir",
                            usedDate: DateTime.now(),
                          );
                        },
                      ),
                    ],
                  ),
                ],
              ),
            ),
            Gap(200.h),
            Column(
              children: [
                AppText(
                  title: AppString.needHelp,
                  fontWeight: FontWeight.w400,
                  fontSize: 12.sp,
                  height: 1.5,
                  letterSpacing: -0.2,
                  textAlign: TextAlign.center,
                ),
                AppText(
                  title: AppString.Contactsupportatsupportbirlaopuscom,
                  fontWeight: FontWeight.w400,
                  fontSize: 12.sp,
                  height: 1.5,
                  letterSpacing: -0.2,
                  textAlign: TextAlign.center,
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
