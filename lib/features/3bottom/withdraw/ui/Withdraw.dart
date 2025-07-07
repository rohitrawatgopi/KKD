import 'package:paint_shop/app/import.dart';
import 'package:paint_shop/features/3bottom/withdraw/widget/button.dart';
import 'package:paint_shop/utils/alert_dilog.dart';
import 'package:paint_shop/utils/app_text_filed.dart';
import 'package:paint_shop/utils/rewar_success_dilo.dart';

class WithdrawScreen extends StatelessWidget {
  const WithdrawScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final height = MediaQuery.of(context).size.height;
    return SingleChildScrollView(
      child: Container(
        decoration: BoxDecoration(
          gradient: LinearGradient(
            end: Alignment.topCenter,
            begin: Alignment.bottomCenter,
            colors: [Colors.white, AppColors.appColor],
          ),
        ),
        padding: EdgeInsets.only(top: 64.h),
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
                    fontSize: 18.sp,
                    fontWeight: FontWeight.w500,
                  ),
                  InkWell(
                    onTap: () {
                      context.push("/trasnactionhistory");
                    },
                    child: Container(
                      height: 40.h,
                      width: 40.w,
                      margin: EdgeInsets.only(left: 10.w),
                      decoration: BoxDecoration(
                        image: const DecorationImage(
                          image: AssetImage("assets/images/withdraw.png"),
                        ),
                        shape: BoxShape.circle,
                        color: Colors.white,
                      ),
                    ),
                  ),
                ],
              ),
            ),
            AppText(
              title: "10,000",
              fontSize: 28.sp,
              fontWeight: FontWeight.w600,
            ),
            AppText(
              title: AppString.AvailableBalance,
              fontSize: 14.sp,
              fontWeight: FontWeight.w500,
            ),
            Gap(26.h),
            AppText(
              title: AppString.Yourwithdrawalrequestisencryptedandsecure,
              fontSize: 12.sp,
              fontWeight: FontWeight.w400,
            ),
            Gap(16.h),

            Container(
              padding: EdgeInsets.symmetric(horizontal: 24.w, vertical: 32.h),
              height: 267.h,
              width: 327.w,
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(24.h),
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

                    fontWeight: FontWeight.w400,
                  ),
                  Gap(12.h),
                  AppText(
                    title: AppString.amountWithdraw,
                    fontWeight: FontWeight.w500,
                    fontSize: 14.sp,
                  ),
                  AppTextField(
                    maxLines: 1,
                    keyBoardType: TextInputType.number,
                    hintText: AppString.EnterAmounttoWithdraw,
                    fontWeight: FontWeight.w500,
                    fontSize: 14.sp,
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
            Gap(0.2 * height),
            ReqAppText(
              textAlign: TextAlign.center,
              title: AppString.needHelp + "\n",
              title2: AppString.Contactsupportatsupportbirlaopuscom,
            ),
            Gap(30.h),
          ],
        ),
      ),
    );
  }
}
