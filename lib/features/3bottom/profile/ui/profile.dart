// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:paint_shop/core/constants/color_constant.dart';
import 'package:paint_shop/core/constants/text_constant.dart';
import 'package:paint_shop/features/3bottom/home/ui/del.dart';
import 'package:paint_shop/utils/app.container.dart';
import 'package:paint_shop/utils/app_text.dart';
import 'package:shimmer/shimmer.dart' show Shimmer;

class ProfileScreen extends StatelessWidget {
  const ProfileScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return AppContainer(
      left: 0,
      right: 0,
      bottom: 0,
      child: Column(
        mainAxisAlignment: MainAxisAlignment.start,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          ListTile(
            horizontalTitleGap: 10.0.w,
            minLeadingWidth: 1,
            leading: Container(
              width: 48.w,
              height: 48.h,
              child: ClipOval(
                child: CachedNetworkImage(
                  cacheManager: MyCacheManager.instance,
                  imageUrl:
                      "https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcSw4L7GfT2eAmeUyLYI_bIUESbxOmZpznUKjN6pJoCNGmNYbfAPnscxY999eK30HMxSk-Y&usqp=CAU",
                  fit: BoxFit.cover,
                  errorWidget: (context, url, error) =>
                      CircleAvatar(child: Icon(Icons.error)),
                  progressIndicatorBuilder: (context, url, progress) => Center(
                    child: Shimmer.fromColors(
                      baseColor: Colors.grey[300]!,
                      highlightColor: Colors.grey[100]!,
                      child: CircleAvatar(radius: 80.r),
                    ),
                  ),
                ),
              ),
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

            trailing: IconButton(icon: Icon(Icons.edit), onPressed: () {}),
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
/*// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:cached_network_image/cached_network_image.dart';
import 'package:form_field_validator/form_field_validator.dart';
import 'package:paint_shop/app/import.dart';
import 'package:paint_shop/features/3bottom/home/ui/del.dart';
import 'package:paint_shop/utils/app.container.dart';
import 'package:paint_shop/utils/app_text_filed.dart';
import 'package:shimmer/shimmer.dart' show Shimmer;

class ProfileScreen extends StatelessWidget {
  ProfileScreen({super.key});
  final _formKey = GlobalKey<FormState>();
  final _emailController = TextEditingController();
  final _passwordController = TextEditingController();
  final _conPasswordController = TextEditingController();
  final _nameController = TextEditingController();
  final _mobileController = TextEditingController();
  void _trySingup() {
    if (_formKey.currentState!.validate()) {}
  }

  @override
  void dispose() {
    _emailController.dispose();
    _passwordController.dispose();
    _nameController.dispose();
    _passwordController.dispose();
    _conPasswordController.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return AppContainer(
      left: 0,
      right: 0,
      bottom: 0,
      child: Column(
        mainAxisAlignment: MainAxisAlignment.start,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          ListTile(
            horizontalTitleGap: 10.0.w,
            minLeadingWidth: 1,
            leading: Container(
              width: 48.w,
              height: 48.h,
              child: ClipOval(
                child: CachedNetworkImage(
                  cacheManager: MyCacheManager.instance,
                  imageUrl:
                      "https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcSw4L7GfT2eAmeUyLYI_bIUESbxOmZpznUKjN6pJoCNGmNYbfAPnscxY999eK30HMxSk-Y&usqp=CAU",
                  fit: BoxFit.cover,
                  errorWidget: (context, url, error) =>
                      CircleAvatar(child: Icon(Icons.error)),
                  progressIndicatorBuilder: (context, url, progress) => Center(
                    child: Shimmer.fromColors(
                      baseColor: Colors.grey[300]!,
                      highlightColor: Colors.grey[100]!,
                      child: CircleAvatar(radius: 80.r),
                    ),
                  ),
                ),
              ),
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

            trailing: IconButton(
              icon: Icon(Icons.edit),
              onPressed: () {
                ScaffoldMessenger.of(context).showSnackBar(
                  SnackBar(
                    content: AlertDialog(
                      content: SingleChildScrollView(
                        child: Form(
                          autovalidateMode: AutovalidateMode.onUnfocus,
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Container(
                                padding: EdgeInsets.symmetric(horizontal: 8.w),
                                child: Column(
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: [
                                    AppText(
                                      title: AppString.fullName,
                                      color: Colors.black,
                                      fontSize: 16.sp,
                                      height: 1.5,
                                      fontWeight: FontWeight.w500,
                                    ),
                                    AppTextField(
                                      textHeight: 1.4,
                                      hintText: AppString.enterYourFullName,
                                      controller: _nameController,
                                      validator: MultiValidator([
                                        RequiredValidator(
                                          errorText: "Name is Required",
                                        ),
                                      ]).call,
                                    ),
                                    Gap(13.h),
                                    AppText(
                                      height: 1.5,
                                      fontWeight: FontWeight.w500,
                                      title: AppString.emailAddress,
                                      color: Colors.black,
                                      fontSize: 16.sp,
                                    ),
                                    AppTextField(
                                      textHeight: 1.4,
                                      keyBoardType: TextInputType.emailAddress,
                                      validator: MultiValidator([
                                        EmailValidator(
                                          errorText: "Enter a valid email",
                                        ),
                                      ]).call,
                                      hintText: AppString.Enteryouremail,
                                      controller: _emailController,
                                    ),
                                    Gap(13.h),
                                    AppText(
                                      height: 1.5,
                                      fontWeight: FontWeight.w500,
                                      title: AppString.mobileNumber,
                                      color: Colors.black,
                                      fontSize: 16.sp,
                                    ),
                                    AppTextField(
                                      textHeight: 1.4,
                                      keyBoardType: TextInputType.phone,
                                      validator: MultiValidator([
                                        PatternValidator(
                                          r'^[0-9]{10}$',
                                          errorText:
                                              'Enter a valid 10‑digit mobile',
                                        ),
                                      ]).call,
                                      hintText: AppString.Enteryourmobilenumber,
                                      controller: _mobileController,
                                    ),
                                    Gap(13.h),
                                    AppText(
                                      height: 1.5,
                                      fontWeight: FontWeight.w500,
                                      title: AppString.createPassword,
                                      color: Colors.black,
                                      fontSize: 16.sp,
                                    ),
                                    AppTextField(
                                      textHeight: 1.4,
                                      obscureText: true,
                                      maxLines: 1,

                                      validator: MultiValidator([
                                        RequiredValidator(
                                          errorText: 'Required',
                                        ),
                                        MinLengthValidator(
                                          8,
                                          errorText: 'Min 6 characters',
                                        ),
                                      ]).call,
                                      hintText: AppString.enterYourPassword,
                                      controller: _passwordController,
                                    ),
                                    Gap(13.h),
                                    AppText(
                                      height: 1.5,
                                      fontWeight: FontWeight.w500,
                                      title: AppString.confirmedPassword,
                                      color: Colors.black,
                                      fontSize: 16.sp,
                                    ),
                                    AppTextField(
                                      maxLines: 1,
                                      obscureText: true,
                                      validator: (val) {
                                        return MatchValidator(
                                          errorText: 'Passwords do not match',
                                        ).validateMatch(
                                          val ?? '',
                                          _passwordController.text.toString(),
                                        );
                                      },
                                      hintText: AppString.enterYourPassword,
                                      controller: _conPasswordController,
                                    ),
                                  ],
                                ),
                              ),
                              Gap(40.h),
                              AppButton(
                                fontHeight: 1.4,
                                color: AppColors.textLightColor,
                                onPressed: () {},
                                fontWeight: FontWeight.w400,
                                fontSize: 14.sp,

                                title: AppString.signUp,
                              ),

                              Gap(13.h),
                              InkWell(
                                onTap: () {
                                  context.go("/login");
                                },
                                child: Align(
                                  alignment: Alignment.center,
                                  child: AppText(
                                    textAlign: TextAlign.center,
                                    fontWeight: FontWeight.w400,
                                    title: AppString.alreadyHaveAnAccount,
                                    color: Colors.black,
                                    fontSize: 14.sp,
                                    height: 1.2,
                                  ),
                                ),
                              ),
                            ],
                          ),
                        ),
                      ),
                    ),
                  ),
                );
              },
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
*/