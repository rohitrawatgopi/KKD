class ResponseModel {
  bool? success;
  String? message;
  dynamic? data;

  ResponseModel({this.success, this.message, this.data});

  factory ResponseModel.fromJson(Map<String, dynamic> json) {
    return ResponseModel(
      success: json['success'] ?? false,
      message: json['message'] ?? '',
      data: (json['data']),
    );
  }
}
