import 'dart:io';

import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:paint_shop/app/import.dart';
import 'package:paint_shop/features/3bottom/home/cubit/home.cubit.dart'
    show HomeCubit;
import 'package:paint_shop/features/3bottom/profile/cubit/profile.cubit.dart';
import 'package:paint_shop/features/3bottom/profile/cubit/profile.state.dart';
import 'package:paint_shop/utils/app.container.dart';
import 'package:paint_shop/utils/toast_message.dart';

class UploadDocumnetScreen extends StatelessWidget {
  final String uploadScreenName;

  const UploadDocumnetScreen({super.key, required this.uploadScreenName});

  @override
  Widget build(BuildContext context) {
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

        child: Column(
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
                  title: AppString.secureYourAccount,
                  fontWeight: FontWeight.w500,
                  fontSize: 20.sp,
                ),
              ],
            ),

            Gap(5.h),
            AppText(
              title: AppString.uploadYour + "${uploadScreenName}",
              fontSize: 14.sp,
              fontWeight: FontWeight.w500,
            ),
            Gap(5.h),

            InkWell(
              onTap: () async {
                file = await context.read<ProfileCubit>().getFilfle();
              },
              child: Container(
                height: 150.h,
                width: 341.w,
                decoration: BoxDecoration(
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
                      } else if (fileExtension == 'pdf') {
                        return Column(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            Icon(
                              Icons.picture_as_pdf,
                              size: 50,
                              color: Colors.red,
                            ),
                            const SizedBox(height: 8),
                            AppText(
                              title: file.path.split('/').last, // Show filename
                              textAlign: TextAlign.center,
                            ),
                          ],
                        );
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
              title: AppString.OnlyJPGPNGorPDF,
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
                    file ?? () {};

                    switch (uploadScreenName) {
                      case AppString.aadharCard:
                        await context.read<ProfileCubit>().upploadAdhar(
                          file: file!,
                        );

                        context.read<HomeCubit>().UserDetailsForProfile();
                        break;
                      case AppString.passbook:
                        await context.read<ProfileCubit>().upploadPass(
                          file: file!,
                        );

                        context.read<HomeCubit>().UserDetailsForProfile();
                        break;
                      case AppString.panCard:
                        await context.read<ProfileCubit>().upploadPan(
                          file: file!,
                        );

                        context.read<HomeCubit>().UserDetailsForProfile();
                        break;

                      default:
                    }
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
    );
  }
}
