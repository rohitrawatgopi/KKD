import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:paint_shop/app/import.dart';
import 'package:paint_shop/features/3bottom/home/cubit/home.cubit.dart';
import 'package:paint_shop/features/3bottom/home/cubit/home.state.dart';
import 'package:paint_shop/features/3bottom/home/widget/carouselSlider.card.dart';
import 'package:paint_shop/features/3bottom/home/widget/category.dart';
import 'package:paint_shop/features/3bottom/home/widget/kkd.card.dart';
import 'package:paint_shop/features/3bottom/home/widget/offer.card.dart';
import 'package:paint_shop/features/3bottom/profile/widget/show.logout.dart';
import 'package:paint_shop/features/network.check/cubit/network.state.dart';
import 'package:paint_shop/utils/app.container.dart';
import 'package:paint_shop/utils/search.container.dart';
import 'package:shimmer/shimmer.dart';
import 'package:smooth_page_indicator/smooth_page_indicator.dart';

class HomeScreen extends StatelessWidget {
  final CarouselSliderController _carouselCtrls = CarouselSliderController();

  HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return AppContainer(
      child: BlocListener<HomeCubit, HomeState>(
        listener: (context, state) {
          if (state is NetworkDisconnected) {
            showLogoutDialog(context);
          }
          if (state is HomeLoading) {
            Center(child: AppText(title: "dsasda"));
            return;
          }
        },
        child: RefreshIndicator(
          onRefresh: () async {
            return context.read<HomeCubit>().UserDetailsForProfile();
          },
          child: SingleChildScrollView(
            child: BlocBuilder<HomeCubit, HomeState>(
              builder: (context, state) {
                if (state is HomeLoading) {
                  return Column(
                    children: [
                      AppSearchContainer(ontab: () {}, image: AppImage.helpImg),
                      Gap(20.h),

                      Shimmer.fromColors(
                        baseColor: Colors.grey[300]!,
                        highlightColor: Colors.grey[100]!,
                        child: Container(
                          width: 343.w,
                          height: 183.h,
                          padding: EdgeInsets.symmetric(
                            horizontal: 16.w,
                            vertical: 24.h,
                          ),
                          decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(16.r),
                            color: Colors.white,
                          ),
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Row(
                                mainAxisAlignment:
                                    MainAxisAlignment.spaceBetween,
                                children: [
                                  Container(
                                    width: 80.w,
                                    height: 12.h,
                                    color: Colors.grey,
                                  ),
                                  Container(
                                    width: 60.w,
                                    height: 12.h,
                                    color: Colors.grey,
                                  ),
                                ],
                              ),
                              Gap(5.h),
                              Row(
                                children: [
                                  Container(
                                    width: 24.w,
                                    height: 24.h,
                                    color: Colors.grey,
                                  ),
                                  Gap(5.w),
                                  Container(
                                    width: 60.w,
                                    height: 24.h,
                                    color: Colors.grey,
                                  ),
                                ],
                              ),
                              Gap(10.h),
                              Container(
                                width: 200.w,
                                height: 20.h,
                                color: Colors.grey,
                              ),
                              Gap(5.h),
                              Container(
                                width: 120.w,
                                height: 14.h,
                                color: Colors.grey,
                              ),
                              Gap(6.h),
                              Container(
                                width: 80.w,
                                height: 12.h,
                                color: Colors.grey,
                              ),
                            ],
                          ),
                        ),
                      ),

                      Gap(20.h),

                      SizedBox(
                        width: double.infinity,
                        height: 98.h,
                        child: ListView.separated(
                          physics: BouncingScrollPhysics(),
                          scrollDirection: Axis.horizontal,
                          itemCount: 4,
                          separatorBuilder: (context, index) =>
                              SizedBox(width: 16.w),
                          itemBuilder: (context, index) {
                            return Column(
                              children: [
                                Shimmer.fromColors(
                                  baseColor: Colors.grey[300]!,
                                  highlightColor: Colors.grey[100]!,
                                  child: Container(
                                    width: 80.w,
                                    height: 80.h,
                                    decoration: BoxDecoration(
                                      shape: BoxShape.circle,
                                      color: Colors.white,
                                    ),
                                  ),
                                ),
                                Gap(4.h),
                                Shimmer.fromColors(
                                  baseColor: Colors.grey[300]!,
                                  highlightColor: Colors.grey[100]!,
                                  child: Container(
                                    width: 60.w,
                                    height: 12.h,
                                    color: Colors.white,
                                  ),
                                ),
                              ],
                            );
                          },
                        ),
                      ),

                      Gap(25.h),

                      Shimmer.fromColors(
                        baseColor: Colors.grey[300]!,
                        highlightColor: Colors.grey[100]!,
                        child: Container(
                          width: 343.w,
                          height: 180.h,
                          decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(8.r),
                            color: Colors.white,
                          ),
                        ),
                      ),

                      Gap(15.h),

                      Shimmer.fromColors(
                        baseColor: Colors.grey[300]!,
                        highlightColor: Colors.grey[100]!,
                        child: Container(
                          width: 343.w,
                          height: 180.h,
                          decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(8.r),
                            color: Colors.white,
                          ),
                        ),
                      ),
                    ],
                  );
                } else if (state is HomeSuccess) {
                  print(state.user.coinsEarned.toString());
                  return Column(
                    children: [
                      AppSearchContainer(ontab: () {}, image: AppImage.helpImg),
                      Gap(20.h),

                      CustomKkdCard(user: state.user),

                      Gap(20.h),
                      SizedBox(
                        width: double.infinity,
                        height: 98.h,
                        child: ListView.separated(
                          physics: const BouncingScrollPhysics(),
                          scrollDirection: Axis.horizontal,
                          itemCount: state.Category.length,
                          separatorBuilder: (context, index) =>
                              SizedBox(width: 16.w),
                          itemBuilder: (context, index) {
                            final category = state.Category[index];
                            return CustomCategoryCard(category: category);
                          },
                        ),
                      ),

                      Gap(20.h),
                      Stack(
                        alignment: Alignment.bottomCenter,
                        children: [
                          CustomCarouselSlider(
                            promotionList: state.prmotion,
                            carouselController: _carouselCtrls,
                          ),

                          Positioned(
                            bottom: 8.h,
                            child: AnimatedSmoothIndicator(
                              activeIndex: state.index,
                              count: state.prmotion.length,
                              effect: WormEffect(
                                dotWidth: 8.w,
                                dotHeight: 8.w,
                                activeDotColor: AppColors.appWhite,
                                dotColor: AppColors.dotColor,
                              ),
                              onDotClicked: (idx) =>
                                  _carouselCtrls.animateToPage(idx),
                            ),
                          ),
                        ],
                      ),
                      Gap(15.h),
                      CustomOfferCard(),
                    ],
                  );
                }

                return Column(
                  children: [
                    AppSearchContainer(ontab: () {}, image: AppImage.helpImg),
                    Gap(20.h),

                    Shimmer.fromColors(
                      baseColor: Colors.grey[300]!,
                      highlightColor: Colors.grey[100]!,
                      child: Container(
                        width: 343.w,
                        height: 183.h,
                        padding: EdgeInsets.symmetric(
                          horizontal: 16.w,
                          vertical: 24.h,
                        ),
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(16.r),
                          color: Colors.white,
                        ),
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Row(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: [
                                Container(
                                  width: 80.w,
                                  height: 12.h,
                                  color: Colors.grey,
                                ),
                                Container(
                                  width: 60.w,
                                  height: 12.h,
                                  color: Colors.grey,
                                ),
                              ],
                            ),
                            Gap(5.h),
                            Row(
                              children: [
                                Container(
                                  width: 24.w,
                                  height: 24.h,
                                  color: Colors.grey,
                                ),
                                Gap(5.w),
                                Container(
                                  width: 60.w,
                                  height: 24.h,
                                  color: Colors.grey,
                                ),
                              ],
                            ),
                            Gap(10.h),
                            Container(
                              width: 200.w,
                              height: 20.h,
                              color: Colors.grey,
                            ),
                            Gap(5.h),
                            Container(
                              width: 120.w,
                              height: 14.h,
                              color: Colors.grey,
                            ),
                            Gap(6.h),
                            Container(
                              width: 80.w,
                              height: 12.h,
                              color: Colors.grey,
                            ),
                          ],
                        ),
                      ),
                    ),

                    Gap(20.h),

                    SizedBox(
                      width: double.infinity,
                      height: 98.h,
                      child: ListView.separated(
                        physics: BouncingScrollPhysics(),
                        scrollDirection: Axis.horizontal,
                        itemCount: 4,
                        separatorBuilder: (context, index) =>
                            SizedBox(width: 16.w),
                        itemBuilder: (context, index) {
                          return Column(
                            children: [
                              Shimmer.fromColors(
                                baseColor: Colors.grey[300]!,
                                highlightColor: Colors.grey[100]!,
                                child: Container(
                                  width: 80.w,
                                  height: 80.h,
                                  decoration: BoxDecoration(
                                    shape: BoxShape.circle,
                                    color: Colors.white,
                                  ),
                                ),
                              ),
                              Gap(4.h),
                              Shimmer.fromColors(
                                baseColor: Colors.grey[300]!,
                                highlightColor: Colors.grey[100]!,
                                child: Container(
                                  width: 60.w,
                                  height: 12.h,
                                  color: Colors.white,
                                ),
                              ),
                            ],
                          );
                        },
                      ),
                    ),

                    Gap(25.h),

                    Shimmer.fromColors(
                      baseColor: Colors.grey[300]!,
                      highlightColor: Colors.grey[100]!,
                      child: Container(
                        width: 343.w,
                        height: 180.h,
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(8.r),
                          color: Colors.white,
                        ),
                      ),
                    ),

                    Gap(15.h),

                    Shimmer.fromColors(
                      baseColor: Colors.grey[300]!,
                      highlightColor: Colors.grey[100]!,
                      child: Container(
                        width: 343.w,
                        height: 180.h,
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(8.r),
                          color: Colors.white,
                        ),
                      ),
                    ),
                  ],
                );
              },
            ),
          ),
        ),
      ),
    );
  }
}
