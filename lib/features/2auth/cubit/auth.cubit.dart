import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:paint_shop/core/network/response_model.dart';
import 'package:paint_shop/features/2auth/cubit/auth.state.dart'
    show AuthState, AuthInitial, AuthLoading, AuthFailure, AuthSuccess;
import 'package:paint_shop/features/repo/auth.dart';
import 'package:paint_shop/utils/dio.erro.dart';

class AuthCubit extends Cubit<AuthState> {
  AuthCubit() : super(AuthInitial());

  Future<void> signIn(String email, String password) async {
    emit(AuthLoading());
    try {
      final ResponseModel response = await AuthRepo.login(
        email: email,
        password: password,
      );

      if (response.success == true) {
        emit(AuthSuccess());
      } else if (response.success == false) {
        emit(AuthFailure(response.message.toString() ?? 'Login failed'));
      }
    } catch (e) {
      emit(AuthFailure(e.toString()));
    }
  }
  // Future<ResponseModel> login({
  //   required String email,
  //   required String password,
  // }) async {
  //   final dioClient = DioClient();
  //   final response = await dioClient.post(
  //     ApiEndpoints.loginURL,
  //     data: {"identifier": email, "password": password},
  //   );

  //   // Parse JSON into your model
  //   return ResponseModel.fromJson(response.data as Map<String, dynamic>);

  // }

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
      print(response.toString());
      if (response.success == true) {
        emit(AuthFailure("Signup successful! Please log in to continue."));
      } else if (response.success == false) {
        emit(AuthFailure(response.message ?? 'Singup failed'));
      }
    } catch (e) {
      final errorMessage = DioErrorHandler.getErrorMessage(e);

      emit(AuthFailure(e.toString()));
    }
  }
}
