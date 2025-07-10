import 'package:paint_shop/app/import.dart';

class CustomLoginHeaad extends StatelessWidget {
  const CustomLoginHeaad({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.only(left: 16.w, right: 16.w, top: 72.h),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          AppText(
            fontWeight: FontWeight.w500,
            height: 1.4,
            title: AppString.welcomeBack,
            color: Colors.black,
            fontSize: 18.sp,
          ),
          AppText(
            fontWeight: FontWeight.w500,
            title: AppString.loginToContinue,
            height: 1.4,
            color: Colors.black,
            fontSize: 14.sp,
          ),
        ],
      ),
    );
  }
}
