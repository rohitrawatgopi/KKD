// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:paint_shop/core/constants/color_constant.dart';
import 'package:paint_shop/core/constants/text_constant.dart';
import 'package:paint_shop/utils/app_text.dart';
import 'package:paint_shop/utils/image_constant.dart';

class ProfileScreen extends StatelessWidget {
  const ProfileScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        gradient: LinearGradient(
          end: Alignment.topCenter,
          begin: Alignment.bottomCenter,
          colors: [Colors.white, AppColors.appColor],
        ),
      ),
      padding: EdgeInsets.only(top: 64.h),
      child: Column(
        children: [
          ListTile(
            horizontalTitleGap: -10.0,
            minLeadingWidth: 0,
            leading: CircleAvatar(
              radius: 48,
              backgroundImage: AssetImage(AppImage.profilePIc),
            ),
            title: AppText(
              title: AppString.estherHoward,
              fontSize: 18,
              fontWeight: FontWeight.w500,
              maxLine: 1,
              textOverflow: TextOverflow.ellipsis,
            ),
            subtitle: AppText(
              title: AppString.contractor,
              fontSize: 12,
              fontWeight: FontWeight.w400,
              maxLine: 1,
              textOverflow: TextOverflow.ellipsis,
            ),
          ),

          SectionContainer(
            title: AppString.personalDetails,
            infoList: [
              InfoRow(label: AppString.contactNumber, value: "+919368903232"),
              InfoRow(
                label: AppString.EmailId,
                value: "rohitrawatrr07@gmail.com",
              ),
              InfoRow(label: AppString.dateOfBirth, value: "15-3-2004"),
              InfoRow(label: AppString.PermanentAddress, value: "Prem nagar"),
              InfoRow(label: AppString.pinCode, value: "+91342fsafa453252"),
              InfoRow(label: AppString.state, value: "Dehradun"),
              InfoRow(label: AppString.country, value: "India"),
            ],
          ),

          SectionContainer(
            title: AppString.kyc,
            infoList: [
              InfoRow(label: AppString.panCard, value: "verified "),
              InfoRow(label: AppString.aadharCard, value: "verified "),
              // ...
            ],
          ),
          SectionContainer(
            title: AppString.bankDetails,
            infoList: [
              InfoRow(
                label: AppString.accountNumber,
                value: "7873 2323 2343 3234",
              ),
              InfoRow(label: AppString.accountHolder, value: "Avneesh"),
              InfoRow(label: AppString.bankName, value: "SBI bank"),
              InfoRow(label: AppString.ifsc, value: "SBIN230001"),
              InfoRow(label: AppString.passbook, value: "Completed"),
            ],
          ),
        ],
      ),
    );
  }
}

class InfoRow extends StatelessWidget {
  final String label, value;
  const InfoRow({required this.label, required this.value});

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        AppText(title: label, fontSize: 14.sp, fontWeight: FontWeight.w500),
        Flexible(
          child: AppText(
            title: value,
            maxLine: 2,
            fontSize: 14,
            textOverflow: TextOverflow.ellipsis,
            fontWeight: FontWeight.w400,
          ),
        ),
      ],
    );
  }
}

class SectionContainer extends StatelessWidget {
  final String title;
  final List<InfoRow> infoList;

  const SectionContainer({
    Key? key,
    required this.title,
    required this.infoList,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.symmetric(vertical: 8.h, horizontal: 16.w),
      padding: EdgeInsets.all(12.w),
      width: double.infinity,
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(8),
        border: Border.all(color: AppColors.cardBorderLightBlue),
        boxShadow: [
          BoxShadow(
            color: Colors.grey.withOpacity(0.3),
            spreadRadius: 1,
            blurRadius: 4,
            offset: Offset(0, 2),
          ),
        ],
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            title,
            style: TextStyle(fontSize: 16.sp, fontWeight: FontWeight.bold),
          ),
          Divider(thickness: 1.5),
          ...infoList,
        ],
      ),
    );
  }
}
