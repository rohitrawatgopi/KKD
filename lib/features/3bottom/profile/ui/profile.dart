// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:paint_shop/app/import.dart';
import 'package:paint_shop/core/model/user.model.dart';
import 'package:paint_shop/features/3bottom/home/cubit/home.cubit.dart';
import 'package:paint_shop/features/3bottom/home/cubit/home.state.dart';
import 'package:paint_shop/features/3bottom/profile/widget/head.profile.dart';
import 'package:paint_shop/utils/app.container.dart';
import 'package:paint_shop/utils/profile.progress.dart';

class ProfileScreen extends StatelessWidget {
  const ProfileScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final state = context.watch<HomeCubit>().state;

    if (state is HomeSuccess) {
      final user = state.user;

      int val = 0;
      if (user.fullName!.isNotEmpty &&
          user.email!.isNotEmpty &&
          user.dob!.isNotEmpty &&
          user.address!.isNotEmpty &&
          user.pinCode!.isNotEmpty &&
          user.state!.isNotEmpty &&
          user.country!.isNotEmpty) {
        val++;
      }
      if (user.aadharVerificationStatus != "incomplete" &&
          user.panVerificationStatus != "incomplete") {
        val++;
      }
      if (user.passbookVerificationStatus != "incomplete" &&
          user.panVerificationStatus != "incomplete") {
        val++;
      }
      return AppContainer(
        left: 0,
        right: 0,
        bottom: 0,
        child: RefreshIndicator(
          onRefresh: () {
            return context.read<HomeCubit>().UserDetailsForProfile();
          },
          child: SingleChildScrollView(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.start,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                CustomProfileHead(user: user),
                Padding(
                  padding: EdgeInsets.only(left: 16.h, top: 10.h),
                  child: ProfileProgressContainer(value: val),
                ),
                SectionContainer(
                  user: user,
                  title: AppString.personalDetails,
                  infoList: [
                    InfoRow(
                      label: AppString.contactNumber,
                      value: user.phone ?? "ds",
                    ),
                    InfoRow(
                      label: AppString.EmailId,
                      value: user.email ?? '..',
                    ),
                    InfoRow(
                      label: AppString.dateOfBirth,
                      value: user.dob ?? '..',
                    ),
                    InfoRow(
                      label: AppString.PermanentAddress,
                      value: user.address ?? '.d.',
                    ),
                    InfoRow(
                      label: AppString.pinCode,
                      value: user.pinCode ?? '..',
                    ),
                    InfoRow(label: AppString.state, value: user.state ?? '..'),
                    InfoRow(
                      label: AppString.country,
                      value: user.country ?? '..',
                    ),
                  ],
                ),

                SectionContainer(
                  user: user,
                  title: AppString.kyc,
                  infoList: [
                    InfoRow(
                      label: AppString.panCard,
                      value: user.panVerificationStatus!.isEmpty
                          ? null
                          : user.panVerificationStatus,
                      value2: AppString.panCard,
                    ),
                    InfoRow(
                      label: AppString.aadharCard,
                      value: user.aadharVerificationStatus!.isEmpty
                          ? null
                          : user.aadharVerificationStatus,
                      value2: AppString.aadharCard,
                    ),
                  ],
                ),

                InkWell(
                  onTap: () {},
                  child: SectionContainer(
                    user: user,
                    title: AppString.bankDetails,
                    infoList: [
                      InfoRow(
                        label: AppString.accountNumber,
                        value: user.accountNumber!.isEmpty
                            ? null
                            : user.accountNumber,
                        value2: AppString.passbook,
                      ),
                      InfoRow(
                        label: AppString.accountHolder,
                        value: user.accountHolderName!.isEmpty
                            ? null
                            : user.accountHolderName,
                        value2: AppString.passbook,
                      ),
                      InfoRow(
                        label: AppString.bankName,
                        value: user.bankName!.isEmpty ? null : user.bankName,
                        value2: AppString.passbook,
                      ),
                      InfoRow(
                        label: AppString.ifsc,
                        value: user.ifscCode!.isEmpty ? null : user.ifscCode,
                        value2: AppString.passbook,
                      ),
                      InfoRow(
                        label: AppString.passbook,
                        value: user.passbookVerificationStatus!.isEmpty
                            ? null
                            : user.passbookVerificationStatus,
                        value2: AppString.passbook,
                      ),
                    ],
                  ),
                ),
              ],
            ),
          ),
        ),
      );
    }

    if (state is HomeFailure) {
      return Center(child: Text("Something went wrong"));
    }

    return Center(child: CircularProgressIndicator());
  }
}

class InfoRow extends StatelessWidget {
  final String label;
  final String? value2;
  final String? value;

  InfoRow({required this.label, this.value, this.value2});

  @override
  Widget build(BuildContext context) {
    final isValueEmpty = value == null || value == "incomplete";

    return Row(
      crossAxisAlignment: CrossAxisAlignment.start,
      mainAxisAlignment: isValueEmpty
          ? MainAxisAlignment.start
          : MainAxisAlignment.spaceBetween,
      children: [
        if (isValueEmpty)
          InkWell(
            onTap: () => context.push("/UploadDocumnetScreen", extra: value2),
            child: Icon(Icons.add_circle_outline_rounded, size: 18),
          ),
        if (isValueEmpty) SizedBox(width: 6),

        AppText(title: label, fontSize: 14.sp, fontWeight: FontWeight.w500),

        if (!isValueEmpty) ...[
          Spacer(),
          Flexible(
            child: AppText(
              title: value!,
              maxLine: 1,
              fontSize: 14,
              textOverflow: TextOverflow.ellipsis,
              fontWeight: FontWeight.w400,
            ),
          ),
        ],
      ],
    );
  }
}

class SectionContainer extends StatelessWidget {
  final String title;
  final List<InfoRow> infoList;
  final UserModel user;
  const SectionContainer({
    Key? key,
    required this.title,
    required this.infoList,
    required this.user,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.symmetric(vertical: 8.h, horizontal: 16.w),
      padding: EdgeInsets.all(12.w),
      width: double.infinity,
      decoration: BoxDecoration(
        color: AppColors.cardColor.withOpacity(0.5),
        borderRadius: BorderRadius.circular(8.r),
        border: Border.all(color: AppColors.cardBorderLightBlue),
        boxShadow: [
          BoxShadow(
            color: const Color.fromRGBO(158, 158, 158, 1).withOpacity(0.3),
            spreadRadius: 1,
            blurRadius: 4,
            offset: Offset(0, 2),
          ),
        ],
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              AppText(
                title: title,
                fontSize: 16.sp,
                fontWeight: FontWeight.bold,
              ),
              if (title == AppString.kyc)
                AppText(title: user.kycStatus!.toString())
              else if (user.passbookVerificationStatus == "incomplete" ||
                  title == AppString.personalDetails)
                InkWell(
                  onTap: () {
                    if (title == AppString.personalDetails) {
                      context.push(
                        "/UdateProfileScreen",
                        extra: {"screenName": title, "user": user},
                      );
                    } else {
                      context.push(
                        "/UdateBankScreen",
                        extra: {"screenName": title, "user": user},
                      );
                    }
                  },
                  child: Icon(Icons.edit),
                )
              else
                const SizedBox.shrink(),
            ],
          ),

          Divider(thickness: 1, color: Colors.black),
          ...infoList,
        ],
      ),
    );
  }
}
