import 'dart:io';

import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_svg/svg.dart';
import 'package:form_field_validator/form_field_validator.dart'
    show
        MinLengthValidator,
        MultiValidator,
        MaxLengthValidator,
        PatternValidator,
        EmailValidator;
import 'package:paint_shop/app/import.dart';
import 'package:paint_shop/core/model/user.model.dart';
import 'package:paint_shop/features/3bottom/home/cubit/home.cubit.dart';
import 'package:paint_shop/features/3bottom/profile/cubit/profile.cubit.dart';
import 'package:paint_shop/features/3bottom/profile/cubit/profile.state.dart';
import 'package:paint_shop/utils/app.container.dart';
import 'package:paint_shop/utils/app_text_filed.dart';
import 'package:paint_shop/utils/toast_message.dart';

class UdateProfileScreen extends StatelessWidget {
  final String updateScreenName;
  final UserModel user;
  const UdateProfileScreen({
    Key? key,
    required this.updateScreenName,
    required this.user,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final contactController = TextEditingController(text: user.phone!);
    final nameController = TextEditingController(text: user.fullName);
    final emailController = TextEditingController(text: user.email);
    final dobController = TextEditingController(text: user.dob);
    final addressController = TextEditingController(text: user.address);
    final pinCodeController = TextEditingController(text: user.pinCode);
    final stateController = TextEditingController(text: user.state);
    final countryController = TextEditingController(text: "India");
    List<String> indianStates = [
      "Select State",
      'Andhra Pradesh',
      'Arunachal Pradesh',
      'Assam',

      'Bihar',
      'Chhattisgarh',
      'Goa',
      'Gujarat',
      'Haryana',
      'Himachal Pradesh',
      'Jharkhand',
      'Karnataka',
      'Kerala',
      'Madhya Pradesh',
      'Maharashtra',
      'Manipur',
      'Meghalaya',
      'Mizoram',
      'Nagaland',
      'Odisha',
      'Punjab',
      'Rajasthan',
      'Sikkim',
      'Tamil Nadu',
      'Telangana',
      'Tripura',
      'Uttar Pradesh',
      'Uttarakhand',
      'West Bengal',
    ];

    File? file;
    return AppContainer(
      child: BlocListener<ProfileCubit, ProfileState>(
        listener: (context, state) {
          if (state is FilePickefailer) {
            AppToast.error(state.msg);
          }
          if (state is FileUploadSuccess) {
            AppToast.success(state.msg);
            context.pop();
          }
          if (state is FileUploadFail) {
            AppToast.error(state.msg);
          }
        },

        child: SingleChildScrollView(
          child: Column(
            spacing: 8.h,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Row(
                children: [
                  InkWell(
                    onTap: () {
                      context.pop();
                    },
                    child: SizedBox(
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
                    title: "${AppString.uploadYour} ${updateScreenName}",
                    fontWeight: FontWeight.w500,
                    fontSize: 20.sp,
                  ),
                ],
              ),

              Gap(5.h),
              AppTextField(controller: nameController),
              AppTextField(
                prefixText: "+91 ",
                validator: MultiValidator([
                  PatternValidator(
                    r'^[0-9]{10}$',
                    errorText: 'Enter a valid 10‑digit mobile',
                  ),
                ]).call,

                keyBoardType: TextInputType.phone,
                hintText: AppString.contactNumber,
                controller: contactController,
              ),
              AppTextField(                                               
                readOnly: true,
                validator: EmailValidator(
                  errorText: 'Enter a valid email',
                ).call,

                hintText: AppString.EmailId,
                controller: emailController,
              ),
              AppTextField(
                readOnly: true,
                hintText: 'DD-MM-YYYY',
                controller: dobController,

                onTap: () async {
                  DateTime? pickedDate = await showDatePicker(
                    context: context,
                    initialDate: DateTime(2000),
                    firstDate: DateTime(1900),
                    lastDate: DateTime.now(),
                  );

                  if (pickedDate != null) {
                    String formattedDate =
                        '${pickedDate.day.toString().padLeft(2, '0')}-${pickedDate.month.toString().padLeft(2, '0')}-${pickedDate.year}';
                    dobController.text = formattedDate;
                  }
                },
                surfixIcon: Icon(Icons.calendar_today),
                validator: (value) {
                  if (value == null || value.isEmpty) {
                    return "DOB is required";
                  }

                  final pattern = RegExp(r'^\d{1,2}-\d{1,2}-\d{4}$');
                  if (!pattern.hasMatch(value)) {
                    return "Use format DD-MM-YYYY";
                  }

                  try {
                    final parts = value.split('-');
                    final day = int.parse(parts[0]);
                    final month = int.parse(parts[1]);
                    final year = int.parse(parts[2]);
                    final dob = DateTime(year, month, day);

                    if (dob.isAfter(DateTime.now())) {
                      return "DOB can't be in the future";
                    }

                    final age = DateTime.now().year - dob.year;
                    if (age < 0 || age > 120) {
                      return "Enter valid DOB";
                    }
                  } catch (_) {
                    return "Invalid date";
                  }

                  return null;
                },
              ),

              AppTextField(
                hintText: AppString.permanentAddress,
                controller: addressController,
              ),
              AppTextField(
                keyBoardType: TextInputType.number,
                validator: MultiValidator([
                  MaxLengthValidator(6, errorText: "Enter Vaild pin code"),
                  MinLengthValidator(6, errorText: 'Enter Vaild pin code'),
                ]).call,

                hintText: AppString.pinCode,
                controller: pinCodeController,
              ),
              AppTextField(
                readOnly: true,
                surfixIcon: BlocBuilder<ProfileCubit, ProfileState>(
                  builder: (context, state) {
                    final cubit = context.read<ProfileCubit>();

                    String? selectedValue;

                    if (state is SlecteStateSuccess) {
                      selectedValue = state.state;
                    } else {
                      selectedValue = cubit.selectedState;
                    }
                    selectedValue = stateController.text.isEmpty
                        ? "Uttarakhand"
                        : stateController.text;
                    return DropdownButton<String>(
                      value: selectedValue,
                      hint: const Text("Select State"),
                      onChanged: (value) {
                        if (value != null) {
                          context.read<ProfileCubit>().selectState(value);
                          stateController.text = value;
                        }
                      },
                      items: indianStates.map((state) {
                        return DropdownMenuItem(
                          value: state,
                          child: Text(state),
                        );
                      }).toList(),
                    );
                  },
                ),
                hintText: AppString.state,
                controller: stateController,
              ),

              AppTextField(
                readOnly: true,
                hintText: AppString.country,
                controller: countryController,
              ),
              Gap(10.h),
              InkWell(
                onTap: () async {
                  file = await context.read<ProfileCubit>().getFilfle();
                },
                child: Container(
                  height: 150.h,
                  width: 341.w,
                  decoration: BoxDecoration(
                    border: Border.all(color: Colors.black),
                    borderRadius: BorderRadius.circular(4),
                    color: AppColors.appWhite,
                  ),

                  child: BlocBuilder<ProfileCubit, ProfileState>(
                    builder: (context, state) {
                      if (state is FilePickeSuccess) {
                        final file = state.file;
                        final fileExtension = file.path
                            .split('.')
                            .last
                            .toLowerCase();

                        if (['jpg', 'jpeg', 'png'].contains(fileExtension)) {
                          return Image.file(file, fit: BoxFit.cover);
                        } else {
                          return const Text('Unsupported file format');
                        }
                      }

                      return Center(
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
                      );
                    },
                  ),
                ),
              ),
              Gap(8.h),
              AppText(
                title: AppString.OnlyJPGPNG,
                fontWeight: FontWeight.w400,
                fontSize: 14.sp,
              ),
              Gap(20.h),

              BlocBuilder<ProfileCubit, ProfileState>(
                builder: (context, state) {
                  if (state is FileUploadLoading) {
                    return Center(child: CircularProgressIndicator());
                  }

                  return AppButton(
                    width: 341.w,
                    hight: 40.h,
                    radius: 12.w,
                    onPressed: () async {
                      await context.read<ProfileCubit>().udateUser(
                        email: emailController.text.trim(),
                        fullName: nameController.text.trim(),
                        address: addressController.text.trim(),
                        phone: contactController.text.trim(),
                        country: countryController.text.trim(),
                        pinCode: pinCodeController.text.trim(),
                        state: stateController.text.trim(),
                        dob: dobController.text.trim(),
                        file: file,
                      );
                      context.read<HomeCubit>().UserDetailsForProfile();
                    },

                    title: AppString.save,
                    fontSize: 14.sp,
                    fontWeight: FontWeight.w400,
                    color: AppColors.buttonColor,
                  );
                },
              ),
            ],
          ),
        ),
      ),
    );
  }
}
