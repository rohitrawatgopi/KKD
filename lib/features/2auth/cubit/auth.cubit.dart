import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:paint_shop/core/network/api_endpoints.dart';
import 'package:paint_shop/core/network/response_model.dart';
import 'package:paint_shop/core/services/token.hive.dart';
import 'package:paint_shop/features/2auth/cubit/auth.state.dart'
    show
        AuthFailure,
        AuthInitial,
        AuthLoading,
        AuthState,
        AuthSuccess,
        PasswordVisibilityChanged;
import 'package:paint_shop/features/repo/auth.dart';
import 'package:paint_shop/utils/dio.erro.dart';

class AuthCubit extends Cubit<AuthState> {
  bool isSSecure = true;
  AuthCubit() : super(AuthInitial());

  Future<void> signIn(String email, String password) async {
    emit(AuthLoading());
    try {
      final ResponseModel response = await AuthRepo.login(
        email: email,
        password: password,
      );

      if (response.success == true) {
        await Token.saveToken(response.data['token']);

        print(response.data['token']);
        print(Token.getToken());
        await Future.delayed(Duration(seconds: 1), () {});
        ApiEndpoints.apiToken = await Token.getToken();
        print(Token.getToken());
        emit(AuthSuccess("Login Successfully"));
      } else if (response.success == false) {
        emit(AuthFailure(response.message.toString() ?? 'Login failed'));
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
      print(response.toString());
      if (response.success == true) {
        emit(AuthSuccess("Signup successful! Please log in to continue."));
      } else if (response.success == false) {
        emit(AuthFailure(response.message ?? 'Singup failed'));
      }
    } catch (e) {
      final errorMessage = DioErrorHandler.getErrorMessage(e);

      emit(AuthFailure(errorMessage));
    }
  }

  void toggleSecure() {
    isSSecure = !isSSecure;
    emit(PasswordVisibilityChanged(isSSecure));
  }
}
