class UserModel {
  final String userId;
  final String fullName;
  final String phone;
  final String email;
  final int coinsEarned;

  UserModel({
    required this.userId,
    required this.fullName,
    required this.phone,
    required this.email,
    required this.coinsEarned,
  });

  factory UserModel.fromJson(Map<String, dynamic> json) {
    return UserModel(
      userId: json['userId'] ?? '',
      fullName: json['fullName'] ?? '',
      phone: json['phone'] ?? '',
      email: json['email'] ?? '',
      coinsEarned: json['coinsEarned'] ?? 0,
    );
  }
}
