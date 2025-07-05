import 'package:paint_shop/core/constants/text_constant.dart';
import 'package:paint_shop/core/model/category.dart';

class CategoryData {
  static final List<CategoryModel> categoryDummyData = [
    CategoryModel(
      name: AppString.interior,
      imagePath: "assets/images/exterior.img.png",
    ),
    CategoryModel(
      name: AppString.exterior,
      imagePath: "assets/images/exterior.img.png",
    ),
    CategoryModel(
      name: AppString.woodFinish,
      imagePath: "assets/images/woodfinisher.img.png",
    ),
    CategoryModel(
      name: AppString.waterproofing,
      imagePath: "assets/images/waterproofing.img.png",
    ),
  ];
}
