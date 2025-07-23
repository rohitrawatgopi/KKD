import 'package:flutter_bloc/flutter_bloc.dart'
    show BlocBuilder, BlocListener, ReadContext, read;
import 'package:flutter_svg/svg.dart';
import 'package:paint_shop/app/import.dart';
import 'package:paint_shop/features/3bottom/home/cubit/home.cubit.dart';
import 'package:paint_shop/features/3bottom/withdraw/cubit/withdraw.cubit.dart';
import 'package:paint_shop/features/3bottom/withdraw/cubit/withdraw.state.dart';
import 'package:paint_shop/features/3bottom/withdraw/widget/button.dart';
import 'package:paint_shop/utils/app.container.dart';
import 'package:paint_shop/utils/app_text_filed.dart';
import 'package:paint_shop/utils/toast_message.dart';
import 'package:shimmer/shimmer.dart';

class WithdrawScreen extends StatelessWidget {
  WithdrawScreen({super.key});
  TextEditingController coinController = TextEditingController();
  @override
  Widget build(BuildContext context) {
    return BlocListener<WithDrawCubit, WithDrawState>(
      listener: (context, state) {
        if (state is WithDrawFailure) {
          AppToast.error(state.message);
        } else if (state is WithDrawSuccess) {
          AppToast.success(state.message);
        }

        if (state is WithDrawLoading) {
          CircularProgressIndicator();
        }
      },
      child: SingleChildScrollView(
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
                        child: SvgPicture.asset(
                          AppImage.withdrawImg,
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
                title: HomeCubit.reusableUser.coinsEarned.toString(),
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
                      title: AppString.amountWithdraw ?? "0",
                      fontWeight: FontWeight.w500,
                      fontSize: 14.sp,
                      letterSpacing: -0.2,
                      height: 1,
                    ),
                    Gap(4.h),
                    AppTextField(
                      controller: coinController,
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
                            coinController.text = "";
                          },
                        ),
                        WithDrawButton(
                          textColor: AppColors.appWhite,
                          bgColor: AppColors.textLightColor,
                          btName: AppString.request,
                          onTab: () {
                            FocusScope.of(context).unfocus();
                            if (coinController.text.isNotEmpty) {
                              context.read<WithDrawCubit>().withdrawCoin(
                                coin: coinController.text,
                              );
                            } else {
                              AppToast.error("enter vaild coin");
                            }
                          },
                          child: BlocBuilder<WithDrawCubit, WithDrawState>(
                            builder: (context, state) {
                              if (state is WithDrawLoading) {
                                return Shimmer.fromColors(
                                  baseColor: Colors.grey[300]!,
                                  highlightColor: const Color.fromARGB(
                                    255,
                                    247,
                                    243,
                                    243,
                                  ),
                                  child: Container(),
                                );
                              }
                              return Center(
                                child: AppText(
                                  title: AppString.request,
                                  color: AppColors.appWhite,
                                  fontSize: 14.sp,
                                  height: 1.5,
                                  letterSpacing: -1,
                                  fontWeight: FontWeight.w400,
                                ),
                              );
                            },
                          ),
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
      ),
    );
  }
}
