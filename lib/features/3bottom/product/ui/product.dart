import 'package:paint_shop/app/import.dart';
import 'package:paint_shop/features/3bottom/product/widget/item.dart';
import 'package:paint_shop/features/3bottom/product/widget/show_bottom.dart';
import 'package:paint_shop/utils/app.container.dart';
import 'package:paint_shop/utils/search.container.dart';

class ProductScreen extends StatelessWidget {
  const ProductScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return AppContainer(
      child: Column(
        children: [
          // Header
          AppSearchContainer(
            ontab: () {
              showFilterBottomSheet(context);
            },
            image: AppImage.FrameImg,
          ),
          Gap(10.h),
          // Scrollable Grid
          Expanded(
            child: GridView.builder(
              itemCount: 20,
              gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                crossAxisCount: 2,
                mainAxisSpacing: 12,
                crossAxisSpacing: 12,
                childAspectRatio: 0.8,
              ),
              itemBuilder: (context, index) {
                return InkWell(
                  onTap: () {
                    context.push(("/details"));
                  },
                  child: ProductCard(),
                );
              },
            ),
          ),
        ],
      ),
    );
  }
}
