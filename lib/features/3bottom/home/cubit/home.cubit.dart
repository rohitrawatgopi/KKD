import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:paint_shop/core/model/category.model.dart';
import 'package:paint_shop/core/model/permotion.dart';
import 'package:paint_shop/core/model/user.model.dart';
import 'package:paint_shop/features/3bottom/home/cubit/home.state.dart';
import 'package:paint_shop/features/repo/home.dart';

class HomeCubit extends Cubit<HomeState> {
  HomeCubit() : super(HomeInitial()) {
    getCategory();
    UserDetails();
    getPrmosion();
  }
  UserModel? _user;
  List<CategoryModel>? _categories;
  List<PromotionModel>? _prmotion;
  static List<CategoryModel> resuableCategory = [];
  static UserModel reusableUser = UserModel();
  Future<void> UserDetails() async {
    try {
      emit(HomeLoading());
      final response = await HomeRepo.UserDetails();
      if (response.success == true) {
        _user = UserModel.fromJson(response.data);
        print(_user!.coinsEarned!.toString());
        reusableUser = _user!;
        _emitCombinedState(); // ← combined emit
      }
    } catch (e) {
      emit(HomeFailure(""));
    }
  }

  Future<void> UserDetailsForProfile() async {
    try {
      final response = await HomeRepo.UserDetails();
      if (response.success == true) {
        _user = UserModel.fromJson(response.data);
        reusableUser = _user!;
        emit(
          HomeSuccess(
            user: _user!,
            Category: _categories!,
            prmotion: _prmotion!,
          ),
        );
      }
    } catch (e) {
      emit(HomeFailure(""));
    }
  }

  Future<void> getCategory() async {
    try {
      final response = await HomeRepo.getCategories();
      if (response.success == true) {
        _categories = (response.data as List)
            .map((e) => CategoryModel.fromJson(e))
            .toList();
        resuableCategory = _categories!;
        _emitCombinedState(); // ← combined emit
      } else {
        emit(HomeFailure(response.message ?? ''));
      }
    } catch (e) {
      emit(HomeFailure(e.toString()));
    }
  }

  Future<void> getPrmosion() async {
    try {
      final response = await HomeRepo.getPermotion();
      if (response.success == true) {
        _prmotion = (response.data as List)
            .map((e) => PromotionModel.fromJson(e))
            .toList();
        _emitCombinedState();
      } else {
        emit(HomeFailure(response.message ?? ''));
      }
    } catch (e) {
      emit(HomeFailure(e.toString()));
    }
  }

  void _emitCombinedState() async {
    if (_user != null && _categories != null && _prmotion != null) {
      print(_user!.coinsEarned!.toString());
      emit(
        HomeSuccess(user: _user!, Category: _categories!, prmotion: _prmotion!),
      );
    }
  }
}
