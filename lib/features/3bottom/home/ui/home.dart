import 'package:cached_network_image/cached_network_image.dart';
import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:paint_shop/app/import.dart';
import 'package:paint_shop/features/3bottom/home/cubit/category.cubit.dart';
import 'package:paint_shop/features/3bottom/home/cubit/category.state.dart';
import 'package:paint_shop/features/3bottom/home/ui/del.dart';
import 'package:paint_shop/utils/app.container.dart';
import 'package:paint_shop/utils/search.container.dart';
import 'package:shimmer/shimmer.dart';
import 'package:smooth_page_indicator/smooth_page_indicator.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

final List<String> banners = [
  AppImage.special1,
  AppImage.special2,
  AppImage.special1,
];
int _currentIndex = 1;
final CarouselSliderController _carouselCtrls = CarouselSliderController();

class _HomeScreenState extends State<HomeScreen> {
  @override
  Widget build(BuildContext context) {
    return AppContainer(
      child: BlocListener<CategoryCubit, CategoryState>(
        listener: (context, state) {
          if (state is CategoryLoading) {
            Center(child: AppText(title: "dsasda"));
            return;
          }
        },
        child: SingleChildScrollView(
          child: Column(
            children: [
              AppSearchContainer(ontab: () {}, image: AppImage.helpImg),
              Gap(20.h),
              Container(
                width: 343.w,
                height: 183.h,
                padding: EdgeInsets.symmetric(horizontal: 16.w, vertical: 24.h),

                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(16.r),

                  image: DecorationImage(
                    image: AssetImage(AppImage.kkdCardImg),
                    fit: BoxFit.cover,
                  ),
                ),

                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        AppText(
                          title: AppString.TOTALCOINS,
                          fontSize: 12.sp,
                          letterSpacing: -0.5,
                          fontWeight: FontWeight.w500,
                        ),
                        AppText(
                          letterSpacing: -0.5,
                          title: AppString.KKDCard,
                          fontSize: 12.sp,
                          fontWeight: FontWeight.w400,
                        ),
                      ],
                    ),
                    Gap(3.h),
                    Row(
                      children: [
                        Image.asset(AppImage.dollar, height: 24, width: 24),
                        Gap(3.w),
                        AppText(
                          title: "5000",
                          height: 1.1,
                          fontSize: 24.sp,
                          fontWeight: FontWeight.w600,
                        ),
                      ],
                    ),
                    AppText(
                      title: "xxxx xxxx xxxx xxxx",
                      fontSize: 24.sp,
                      fontWeight: FontWeight.w600,
                    ),
                    AppText(
                      title: "AAYUSH GUPTA",
                      fontSize: 14.sp,
                      letterSpacing: -0.5,
                      fontWeight: FontWeight.w500,
                    ),
                    Gap(6.h),

                    AppText(
                      title: "View Details",
                      letterSpacing: -0.5,
                      fontSize: 12.sp,
                      fontWeight: FontWeight.w400,
                    ),
                  ],
                ),
              ),
              Gap(20.h),
              BlocBuilder<CategoryCubit, CategoryState>(
                builder: (context, state) {
                  if (state is CategoryFailure) {
                    return SizedBox(
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
                              ClipRRect(
                                borderRadius: BorderRadius.circular(50.w),
                                child: CachedNetworkImage(
                                  imageUrl:
                                      "https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcSw4L7GfT2eAmeUyLYI_bIUESbxOmZpznUKjN6pJoCNGmNYbfAPnscxY999eK30HMxSk-Y&usqp=CAU",
                                  width: 80.w,
                                  height: 80.h,
                                  fit: BoxFit.cover,
                                  errorWidget: (context, url, error) =>
                                      CircleAvatar(
                                        child: Icon(
                                          Icons.error,
                                          size: 40.w,
                                          color: Colors.red,
                                        ),
                                      ),
                                  progressIndicatorBuilder:
                                      (context, url, progress) => Center(
                                        child: Shimmer.fromColors(
                                          baseColor: Colors.grey[300]!,
                                          highlightColor: Colors.grey[100]!,
                                          child: CircleAvatar(radius: 80.r),
                                        ),
                                      ),
                                ),
                              ),
                            ],
                          );
                        },
                      ),
                    );
                  }
                  if (state is CategorySuccess) {
                    return SizedBox(
                      width: double.infinity,
                      height: 98.h,
                      child: ListView.separated(
                        physics: BouncingScrollPhysics(),
                        scrollDirection: Axis.horizontal,
                        itemCount: state.categoryList.length,
                        separatorBuilder: (context, index) =>
                            SizedBox(width: 16.w),
                        itemBuilder: (context, index) {
                          final category = state.categoryList[index];
                          return Column(
                            children: [
                              ClipRRect(
                                borderRadius: BorderRadius.circular(50.w),
                                child: CachedNetworkImage(
                                  cacheManager: MyCacheManager.instance,
                                  imageUrl: category.categoryImage,
                                  width: 80.w,
                                  height: 80.h,
                                  fit: BoxFit.cover,
                                  errorWidget: (context, url, error) =>
                                      CircleAvatar(child: Icon(Icons.error)),
                                  progressIndicatorBuilder:
                                      (context, url, progress) => Center(
                                        child: Shimmer.fromColors(
                                          baseColor: Colors.grey[300]!,
                                          highlightColor: Colors.grey[100]!,
                                          child: CircleAvatar(radius: 80.r),
                                        ),
                                      ),
                                ),
                              ),

                              AppText(
                                textAlign: TextAlign.center,
                                letterSpacing: 0,
                                textOverflow: TextOverflow.ellipsis,
                                title: category.categoryName,
                                fontSize: 12.sp,
                                fontWeight: FontWeight.w500,
                              ),
                            ],
                          );
                        },
                      ),
                    );
                  }
                  return Center(
                    widthFactor: 80.w,
                    heightFactor: 80.h,
                    child: Shimmer.fromColors(
                      baseColor: Colors.grey[300]!,
                      highlightColor: Colors.grey[100]!,
                      child: CircleAvatar(radius: 80.w),
                    ),
                  );
                },
              ),

              Gap(25.h),

              Stack(
                alignment: Alignment.bottomCenter,
                children: [
                  CarouselSlider.builder(
                    carouselController: _carouselCtrls,
                    itemCount: banners.length,
                    itemBuilder: (_, index, __) => ClipRRect(
                      borderRadius: BorderRadiusGeometry.circular(8.r),
                      child: Image.asset(
                        banners[index],
                        width: 343.w,
                        height: 180.h,
                        fit: BoxFit.cover,
                      ),
                    ),
                    options: CarouselOptions(
                      viewportFraction: 1.0,
                      autoPlay: true,
                      onPageChanged: (idx, reason) {
                        setState(() {
                          print(idx.toString());
                          _currentIndex = idx;
                        });
                      },
                    ),
                  ),

                  Positioned(
                    bottom: 8.h,
                    child: AnimatedSmoothIndicator(
                      activeIndex: _currentIndex,
                      count: banners.length,
                      effect: WormEffect(
                        dotWidth: 8.w,
                        dotHeight: 8.w,
                        activeDotColor: AppColors.appWhite,
                        dotColor: AppColors.dotColor,
                      ),
                      onDotClicked: (idx) => _carouselCtrls.animateToPage(idx),
                    ),
                  ),
                ],
              ),
              Gap(15.h),
              InkWell(
                onTap: () {
                  context.push("/offer");
                },
                child: ClipRRect(
                  borderRadius: BorderRadiusGeometry.circular(8.r),
                  child: Image.asset(
                    AppImage.special2,
                    height: 180.h,
                    width: 343.w,
                    fit: BoxFit.cover,
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
