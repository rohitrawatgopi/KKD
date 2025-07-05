// import 'package:dio/dio.dart';

// class ApiClient {
//   static final Dio _dio = Dio(
//     BaseOptions(
//       baseUrl: 'https://yourapi.com/api', // Replace with your base URL
//       connectTimeout: const Duration(seconds: 10),
//       receiveTimeout: const Duration(seconds: 10),
//       headers: {
//         'Content-Type': 'application/json',
//         // 'Authorization': 'Bearer your_token', // Add dynamically if needed
//       },
//     ),
//   );

//   // 🔹 GET
//   static Future<dynamic> get(String endpoint) async {
//     try {
//       final response = await _dio.get(endpoint);
//       return response.data;
//     } on DioException catch (e) {
//       throw _handleError(e);
//     }
//   }

//   // 🔹 POST
//   static Future<dynamic> post(
//     String endpoint,
//     Map<String, dynamic> data,
//   ) async {
//     try {
//       final response = await _dio.post(endpoint, data: data);
//       return response.data;
//     } on DioException catch (e) {
//       throw _handleError(e);
//     }
//   }

//   // 🔹 PUT
//   static Future<dynamic> put(String endpoint, Map<String, dynamic> data) async {
//     try {
//       final response = await _dio.put(endpoint, data: data);
//       return response.data;
//     } on DioException catch (e) {
//       throw _handleError(e);
//     }
//   }

//   // 🔹 DELETE
//   static Future<dynamic> delete(String endpoint) async {
//     try {
//       final response = await _dio.delete(endpoint);
//       return response.data;
//     } on DioException catch (e) {
//       throw _handleError(e);
//     }
//   }

//   // ❗ Handle Errors
//   static String _handleError(DioException error) {
//     if (error.response != null) {
//       return error.response?.data['message'] ?? 'Something went wrong';
//     } else {
//       return 'Network Error: ${error.message}';
//     }
//   }

//   // 🛡️ Optional: Add token dynamically
//   void setAuthToken(String token) {
//     _dio.options.headers['Authorization'] = 'Bearer $token';
//   }
// }
import 'dart:developer';
import 'dart:io';

import 'package:dio/dio.dart';
import 'package:paint_shop/core/network/api_endpoints.dart';
import 'package:pretty_dio_logger/pretty_dio_logger.dart';

/// A class that provides a wrapper around the Dio HTTP client library.
///
/// This class provides methods for making HTTP requests such as GET, POST, PUT, PATCH, and DELETE.
/// It also sets up the base URL, headers, timeouts, response type, and interceptors for the Dio client.
class DioClient {
  late final Dio _dio;

  DioClient() {
    _dio = Dio();

    _dio
      ..options.baseUrl = ApiEndpoints.baseUrl
      ..options.headers = {
        HttpHeaders.contentTypeHeader: ContentType.json.mimeType,
        HttpHeaders.authorizationHeader: 'Bearer ${ApiEndpoints.apiToken}',
      }
      ..options.connectTimeout = const Duration(milliseconds: 15000)
      ..options.receiveTimeout = const Duration(milliseconds: 15000)
      ..options.responseType = ResponseType.json
      ..interceptors.add(
        PrettyDioLogger(
          compact: false,
          logPrint: (object) => log(object.toString(), name: 'TMDB API'),
        ),
      );
  }

  /// * GET
  Future<Response<dynamic>> get(
    String url, {
    Map<String, dynamic>? queryParameters,
    Options? options,
    CancelToken? cancelToken,
    ProgressCallback? onReceiveProgress,
  }) async {
    try {
      final response = await _dio.get(
        url,
        queryParameters: queryParameters,
        options: options,
        cancelToken: cancelToken,
        onReceiveProgress: onReceiveProgress,
      );
      return response;
    } on DioException {
      rethrow;
    }
  }

  /// * POST
  Future<Response<dynamic>> post(
    String uri, {
    data,
    Map<String, dynamic>? queryParameters,
    Options? options,
    CancelToken? cancelToken,
    ProgressCallback? onSendProgress,
    ProgressCallback? onReceiveProgress,
  }) async {
    try {
      final response = await _dio.post(
        uri,
        data: data,
        queryParameters: queryParameters,
        options: options,
        cancelToken: cancelToken,
        onSendProgress: onSendProgress,
        onReceiveProgress: onReceiveProgress,
      );

      return response;
    } on DioException {
      rethrow;
    }
  }

  /// * PUT
  Future<Response<dynamic>> put(
    String uri, {
    data,
    Map<String, dynamic>? queryParameters,
    Options? options,
    CancelToken? cancelToken,
    ProgressCallback? onSendProgress,
    ProgressCallback? onReceiveProgress,
  }) async {
    try {
      final response = await _dio.put(
        uri,
        data: data,
        queryParameters: queryParameters,
        options: options,
        cancelToken: cancelToken,
        onSendProgress: onSendProgress,
        onReceiveProgress: onReceiveProgress,
      );
      return response;
    } on DioException {
      rethrow;
    }
  }

  /// * PATCH
  Future<Response<dynamic>> patch(
    String uri, {
    data,
    Map<String, dynamic>? queryParameters,
    Options? options,
    CancelToken? cancelToken,
    ProgressCallback? onSendProgress,
    ProgressCallback? onReceiveProgress,
  }) async {
    try {
      final response = await _dio.patch(
        uri,
        data: data,
        queryParameters: queryParameters,
        options: options,
        cancelToken: cancelToken,
        onSendProgress: onSendProgress,
        onReceiveProgress: onReceiveProgress,
      );
      return response;
    } on DioException {
      rethrow;
    }
  }

  /// * DELETE
  Future<dynamic> delete(
    String uri, {
    data,
    Map<String, dynamic>? queryParameters,
    Options? options,
    CancelToken? cancelToken,
    ProgressCallback? onSendProgress,
    ProgressCallback? onReceiveProgress,
  }) async {
    try {
      final response = await _dio.delete(
        uri,
        data: data,
        queryParameters: queryParameters,
        options: options,
        cancelToken: cancelToken,
      );
      return response;
    } on DioException {
      rethrow;
    }
  }
}
