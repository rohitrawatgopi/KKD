import 'package:file_picker/file_picker.dart';
import 'package:paint_shop/app/import.dart';

class UploadDocumnetScreen extends StatefulWidget {
  final String UploadScreenName;
  const UploadDocumnetScreen({super.key, required this.UploadScreenName});

  @override
  State<UploadDocumnetScreen> createState() => _UploadDocumnetScreenState();
}

class _UploadDocumnetScreenState extends State<UploadDocumnetScreen> {
  // final FilePicker_selectedFile _selectedFile = FilePicker_selectedFile([]);
  PlatformFile? _selectedFile;
  String? _error;
  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.infinity,
      decoration: BoxDecoration(
        gradient: LinearGradient(
          end: Alignment.topCenter,
          begin: Alignment.bottomCenter,
          colors: [Colors.white, AppColors.appColor],
        ),
      ),
      padding: EdgeInsets.only(top: 64.h, left: 18.w, right: 18.w),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          AppText(
            title: AppString.secureYourAccount,
            fontWeight: FontWeight.w500,
            fontSize: 20.sp,
          ),
          Gap(5.h),
          AppText(
            title: AppString.uploadYourBankPassbook,
            fontSize: 14.sp,
            fontWeight: FontWeight.w500,
          ),
          Gap(5.h),

          ?InkWell(
            onTap: () async {
              await FilePicker.platform.pickFiles(
                allowMultiple: true,
                type: FileType.custom,
                allowedExtensions: ['jpg', 'pdf', 'png'],
              );
              if (_selectedFile != null) {
                {
                  setState(() {});
                }
              } else {
                print('User canceled picker.');
              }

              // FilePicker_selectedFile? _selectedFile = await FilePicker.platform.pickFiles(
              //   type: FileType.custom,
              //   allowedExtensions: ['pdf', 'jpg', 'png'], // allowed file types
              // );

              // if (_selectedFile != null && _selectedFile.files.isNotEmpty) {
              //   PlatformFile file = _selectedFile.files.first;

              //   // Example validation: Max 5MB file size
              //   if (file.size > 5 * 1024 * 1024) {
              //     setState(() {
              //       _error = 'File size should be less than 5MB';
              //       _selectedFile = null;
              //     });
              //   } else {
              //     setState(() {
              //       _selectedFile = file;
              //     });
              //   }
              // } else {
              //   // No file selected
              //   setState(() {
              //     _error = 'No file selected';
              //     _selectedFile = null;
              //   });
              // }
            },
            child: Container(
              height: 150.h,
              width: 341.w,
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(4),
                color: AppColors.appWhite,
              ),
              padding: EdgeInsets.symmetric(horizontal: 12, vertical: 10),
              child: Center(
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
          AppButton(
            width: 341.w,
            hight: 40.h,
            radius: 12.w,
            onPressed: () {},

            title: AppString.save,
            fontSize: 14.sp,
            fontWeight: FontWeight.w400,
            color: AppColors.buttonColor,
          ),
        ],
      ),
    );
  }
}
