import 'package:dio/dio.dart';
import 'package:paint_shop/core/network/api_client.dart';
import 'package:paint_shop/core/network/api_endpoints.dart';

class AuthRepo {
  static Future Login({required String email, required String password}) async {
    DioClient dioClient = DioClient();

    final Response response = await dioClient.post(
      ApiEndpoints.loginURL,
      data: {"identifier": email, "password": password},
    );

    return response;
  }

  static Future SignUp({
    required String email,
    required String password,
    required String fullName,
    required String phone,
  }) async {
    DioClient dioClient = DioClient();

    final Response response = await dioClient.post(
      ApiEndpoints.singnUpURL,
      data: {
        "fullName": fullName,
        "phone": phone,
        "email": email,
        "password": password,
      },
    );

    return response;
  }
}
