class ResponseModel {
  bool? success;
  String? message;
  String? token;
  dynamic user;

  ResponseModel(this.success, this.user, this.message, this.token);

  factory ResponseModel.fromJson(Map<String, dynamic> json) => ResponseModel(
    json['success'],

    json['user'],
    json['message'] ?? json['msg'],
    json['token'],
  );
}
