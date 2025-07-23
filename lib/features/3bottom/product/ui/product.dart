import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:paint_shop/app/import.dart';
import 'package:paint_shop/core/model/product.dart';
import 'package:paint_shop/features/3bottom/product/cubit/product.cubit.dart';
import 'package:paint_shop/features/3bottom/product/cubit/product.state.dart';
import 'package:paint_shop/features/3bottom/product/widget/item.dart';
import 'package:paint_shop/features/3bottom/product/widget/show_bottom.dart';
import 'package:paint_shop/utils/app.container.dart';
import 'package:paint_shop/utils/search.container.dart';
import 'package:paint_shop/utils/toast_message.dart';
import 'package:shimmer/shimmer.dart';

class ProductScreen extends StatefulWidget {
  const ProductScreen({super.key});

  @override
  State<ProductScreen> createState() => _ProductScreenState();
}

class _ProductScreenState extends State<ProductScreen> {
  final ScrollController _scrollController = ScrollController();
  bool _isLoadingMore = true;

  @override
  void initState() {
    ProductCubit.page1 = 1;

    _scrollController.addListener(() {
      if (_scrollController.position.pixels >=
              _scrollController.position.maxScrollExtent - 100 &&
          _isLoadingMore) {
        print(_isLoadingMore.toString());
        _isLoadingMore = false;
        context.read<ProductCubit>().getPageWise();
      }
    });
    super.initState();
  }

  @override
  void dispose() {
    _scrollController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return BlocConsumer<ProductCubit, ProductState>(
      listener: (context, state) {
        if (state is ProductFailure) {
          AppToast.error(state.message);
        }
      },
      builder: (context, state) {
        if (state is ProductSuccess) {
          List<ProductModel> productList = state.products;
          _isLoadingMore = state.paginationModel?.hasMore ?? false;

          return RefreshIndicator(
            onRefresh: () async {
              return context.read<ProductCubit>().getPageWise(page: 1);
            },
            child: AppContainer(
              left: 8.w,
              right: 8.w,

              child: Column(
                children: [
                  AppSearchContainer(
                    ontab: () {
                      showFilterBottomSheet(context);
                    },
                    image: AppImage.filter,
                  ),
                  Gap(15.h),
                  Expanded(
                    flex: 1,
                    child: productList.isEmpty
                        ? const ProductCardShimmer()
                        : MediaQuery.removePadding(
                            context: context,
                            removeTop: true,
                            child: GridView.builder(
                              // your GridView config GridView.builder(
                              controller: _scrollController,
                              itemCount: productList.length + 1,
                              gridDelegate:
                                  SliverGridDelegateWithFixedCrossAxisCount(
                                    crossAxisCount: 2,
                                    childAspectRatio: 0.86,
                                    crossAxisSpacing: 5.w,
                                  ),
                              itemBuilder: (context, index) {
                                if (index < productList.length) {
                                  return InkWell(
                                    onTap: () {},
                                    child: ProductCard(
                                      product: productList[index],
                                    ),
                                  );
                                }
                                if (state.paginationModel?.hasMore == true) {
                                  return const Center(
                                    child: ProductCardShimmer(),
                                  );
                                } else {
                                  return const Center(
                                    child: AppText(title: "No more intem"),
                                  );
                                }
                              },
                            ),
                          ),
                  ),
                ],
              ),
            ),
          );
        }

        return Container(
          padding: EdgeInsets.all(8.h),
          child: Column(
            children: [
              Gap(45.h),
              AppSearchContainerShimmer(),

              Gap(15.h),
              Expanded(
                child: MediaQuery.removePadding(
                  context: context,
                  removeTop: true,
                  child: GridView.builder(
                    controller: _scrollController,
                    itemCount: 6,
                    gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                      crossAxisCount: 2,
                      childAspectRatio: 0.8,
                      crossAxisSpacing: 5.w,
                    ),
                    itemBuilder: (context, index) {
                      return InkWell(onTap: () {}, child: ProductCardShimmer());
                    },
                  ),
                ),
              ),
            ],
          ),
        );
      },
    );
  }
}

class ProductCardShimmer extends StatelessWidget {
  const ProductCardShimmer({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 160.h,
      width: 164.w,
      padding: EdgeInsets.only(top: 8.h, bottom: 8.h),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(8.r),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Padding(
            padding: EdgeInsets.symmetric(vertical: 8.h, horizontal: 10.w),
            child: Container(
              height: 128.h,
              width: 114.w,
              color: Colors.grey[300], // Placeholder for image
            ),
          ),
        ],
      ),
    );
  }
}

class AppSearchContainerShimmer extends StatelessWidget {
  const AppSearchContainerShimmer({super.key});

  @override
  Widget build(BuildContext context) {
    return Shimmer.fromColors(
      baseColor: Colors.grey[300]!,
      highlightColor: Colors.grey[100]!,
      child: Row(
        children: [
          Container(
            width: 287.w,
            height: 40.h,
            decoration: BoxDecoration(
              color: Colors.white,
              borderRadius: BorderRadius.circular(36.r),
            ),
            padding: EdgeInsets.fromLTRB(15.w, 11.h, 10.w, 11.h),
            child: Container(
              height: 18.h,
              width: double.infinity,
              decoration: BoxDecoration(
                color: Colors.grey[300],
                borderRadius: BorderRadius.circular(20.r),
              ),
            ),
          ),
          Gap(10.w, color: Colors.transparent),
          Container(
            height: 40.h,
            width: 40.w,
            padding: EdgeInsets.all(10.w),
            decoration: BoxDecoration(
              color: Colors.grey[300],
              borderRadius: BorderRadius.circular(20.r),
            ),
          ),
        ],
      ),
    );
  }
}
