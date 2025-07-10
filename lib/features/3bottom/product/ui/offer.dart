import 'package:paint_shop/app/import.dart';
import 'package:paint_shop/features/3bottom/product/widget/offer.product.dart';
import 'package:paint_shop/utils/app.container.dart';

class OfferScreen extends StatelessWidget {
  const OfferScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return AppContainer(
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Row(
            children: [
              InkWell(
                onTap: () {
                  context.pop();
                },
                child: Container(
                  height: 24.h,
                  width: 34.w,
                  child: Image.asset(
                    AppImage.backImg,
                    height: 15.h,
                    width: 18.w,
                  ),
                ),
              ),
              Gap(4.w),
              AppText(
                title: AppString.Offers,
                color: Colors.black,
                fontWeight: FontWeight.w500,
                fontSize: 18.sp,
              ),
            ],
          ),
          Gap(16.h),
          Expanded(
            child: GridView.builder(
              itemCount: 20,
              padding: EdgeInsets.only(top: 8.h),
              gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                crossAxisCount: 2,
                mainAxisSpacing: 12,
                crossAxisSpacing: 12,
                childAspectRatio: 0.8,
              ),
              itemBuilder: (context, index) {
                return InkWell(
                  onTap: () {
                    context.push("/details");
                  },
                  child: OfferProductCard(),
                );
              },
            ),
          ),
        ],
      ),
    );
  }
}
