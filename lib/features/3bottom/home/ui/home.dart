import 'package:carousel_slider/carousel_slider.dart';
import 'package:paint_shop/app/import.dart';
import 'package:paint_shop/core/constants/category.dart';
import 'package:paint_shop/utils/app.container.dart';
import 'package:paint_shop/utils/search.container.dart';
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
    int _current = 0;
    return AppContainer(
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
                borderRadius: BorderRadius.circular(16),

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
                        fontWeight: FontWeight.w500,
                      ),
                      AppText(
                        title: AppString.KKDCard,
                        fontSize: 12.sp,
                        fontWeight: FontWeight.w400,
                      ),
                    ],
                  ),
                  Row(
                    children: [
                      Image.asset(AppImage.dollar, height: 24, width: 24),
                      Gap(3.w),
                      AppText(
                        title: "5000",
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
                    fontWeight: FontWeight.w500,
                  ),
                  Gap(6.h),

                  AppText(
                    title: "View Details",
                    fontSize: 12.sp,
                    fontWeight: FontWeight.w400,
                  ),
                ],
              ),
            ),
            Gap(20.h),
            SizedBox(
              width: double.infinity,
              height: 100.h,
              child: ListView.separated(
                physics: BouncingScrollPhysics(),
                scrollDirection: Axis.horizontal,
                itemCount: CategoryData.categoryDummyData.length,
                separatorBuilder: (context, index) => SizedBox(width: 16.w),
                itemBuilder: (context, index) {
                  final category = CategoryData.categoryDummyData[index];
                  return Column(
                    children: [
                      ClipRRect(
                        borderRadius: BorderRadius.circular(50.w),
                        child: Image.asset(
                          category.imagePath!,
                          width: 80.w,
                          height: 80.h,
                          fit: BoxFit.cover,
                        ),
                      ),
                      AppText(
                        textOverflow: TextOverflow.ellipsis,
                        title: category.name!,
                        fontSize: 12.sp,
                        fontWeight: FontWeight.w500,
                      ),
                    ],
                  );
                },
              ),
            ),

            Gap(25.h),

            Stack(
              alignment: Alignment.bottomCenter,
              children: [
                CarouselSlider.builder(
                  carouselController: _carouselCtrls,
                  itemCount: banners.length,
                  itemBuilder: (_, index, __) => ClipRRect(
                    borderRadius: BorderRadiusGeometry.circular(12.w),
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
            ClipRRect(
              borderRadius: BorderRadiusGeometry.circular(12.w),
              child: Image.asset(
                AppImage.special2,
                height: 180,
                width: 343,
                fit: BoxFit.cover,
              ),
            ),
          ],
        ),
      ),
    );
  }
}
