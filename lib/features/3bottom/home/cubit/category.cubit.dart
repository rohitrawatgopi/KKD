import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:paint_shop/core/model/category.model.dart';
import 'package:paint_shop/core/network/response_model.dart';
import 'package:paint_shop/features/3bottom/home/cubit/category.state.dart';
import 'package:paint_shop/features/repo/category.dart';

class CategoryCubit extends Cubit<CategoryState> {
  CategoryCubit() : super(CategoryInitial()) {
    getCategory();
  }

  Future<void> getCategory() async {
    emit(CategoryLoading());
    try {
      final ResponseModel response = await CategoryRepo.getCategories();

      if (response.success == true) {
        final List<CategoryModel> categories = (response.data as List)
            .map((json) => CategoryModel.fromJson(json))
            .toList();
        if (categories != categories) {
          emit(CategorySuccess(categoryList: categories));
        }

        emit(CategorySuccess(categoryList: categories));
      } else if (response.success == false) {
        emit(CategoryFailure(response.message.toString() ?? 'Login failed'));
      }
    } catch (e) {
      emit(CategoryFailure(e.toString()));
    }
  }
}
