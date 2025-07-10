import 'package:paint_shop/core/model/category.model.dart';

abstract class CategoryState {}

class CategoryInitial extends CategoryState {}

class CategoryLoading extends CategoryState {}

class CategorySuccess extends CategoryState {
  final List<CategoryModel> categoryList;

  CategorySuccess({required this.categoryList});
}

class CategoryFailure extends CategoryState {
  final String message;
  CategoryFailure(this.message);
}
