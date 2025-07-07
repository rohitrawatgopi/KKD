import 'dart:developer';

import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:paint_shop/core/network/response_model.dart';
import 'package:paint_shop/features/2auth/cubit/auth.state.dart'
    show AuthState, AuthInitial, AuthLoading, AuthSuccess, AuthFailure;
import 'package:paint_shop/features/2auth/repo/auth.dart';

class AuthCubit extends Cubit<AuthState> {
  AuthCubit() : super(AuthInitial());

  Future<void> signIn(String email, String password) async {
    emit(AuthLoading());
    try {
      final ResponseModel response = await AuthRepo.Login(
        email: email,
        password: password,
      );

      if (response.success == true) {
        emit(AuthSuccess(response.data));
      } else {
        emit(AuthFailure(response.message ?? 'Login failed'));
      }
    } catch (e) {
      emit(AuthFailure(e.toString()));
    }
  }

  Future<void> signUp({
    required String email,
    required String password,
    required String fullName,
    required String phone,
  }) async {
    emit(AuthLoading());
    try {
      final ResponseModel response = await AuthRepo.SignUp(
        fullName: fullName,
        password: password,
        phone: phone,
        email: email,
      );

      if (response.success == true) {
        log(response.data.toString());
      } else {
        emit(AuthFailure(response.message ?? 'Singup failed'));
      }
    } catch (e) {
      emit(AuthFailure(e.toString()));
    }
  }
}
