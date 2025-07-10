import 'package:paint_shop/app/import.dart';
import 'package:paint_shop/utils/app_text_filed.dart';

class AppSearchContainer extends StatelessWidget {
  final String? hintText;
  final TextEditingController? controller;
  final String image;
  final VoidCallback ontab;

  const AppSearchContainer({
    Key? key,
    required this.ontab,
    this.hintText,
    this.controller,

    required this.image,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Container(
          height: 40.h,
          width: 287.w,
          padding: EdgeInsets.fromLTRB(15.w, 11.h, 10.w, 11.h),
          decoration: BoxDecoration(
            color: Colors.white,
            borderRadius: BorderRadius.circular(36.r),
          ),
          child: Row(
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              Icon(Icons.search, size: 20.w),
              Gap(4.w),
              Expanded(
                child: AppTextField(
                  controller: controller,
                  fontSize: 12.sp,

                  hintText: AppString.Search,
                  isCollapsed: true,
                  contentPadding: EdgeInsets.zero,
                ),
              ),
            ],
          ),
        ),
        InkWell(
          onTap: ontab,
          child: Container(
            height: 40.h,
            width: 40.w,
            margin: EdgeInsets.only(left: 10.w),
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(20.r),
              image: DecorationImage(image: AssetImage(image)),

              color: Colors.white,
            ),
          ),
        ),
      ],
    );
  }
}
