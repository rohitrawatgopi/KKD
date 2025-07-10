import 'package:paint_shop/app/import.dart';

class CustomSingupHead extends StatelessWidget {
  const CustomSingupHead({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.start,
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        AppText(
          fontWeight: FontWeight.w500,
          title: AppString.signUp,
          color: Colors.black,
          fontSize: 18.sp,

          height: 1.3.sp,
        ),

        AppText(
          fontWeight: FontWeight.w500,
          title: AppString.createYourAccount,
          color: Colors.black,
          fontSize: 14.sp,
          height: 1.3.sp,
        ),
      ],
    );
  }
}
