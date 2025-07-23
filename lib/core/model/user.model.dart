class UserModel {
  final String? id;
  final String? fullName;
  final String? userId;
  final String? phone;
  final String? email;
  final String? profilePick;
  final int? coinsEarned;
  final String? dob;
  final String? address;
  final String? pinCode;
  final String? state;
  final String? country;
  final String? accountNumber;
  final String? accountHolderName;
  final String? bankName;
  final String? ifscCode;
  final String? panPhoto;
  final String? panVerificationStatus;
  final String? panRejectionReason;
  final String? aadharPhoto;
  final String? aadharVerificationStatus;
  final String? aadharRejectionReason;
  final String? passbookPhoto;
  final String? passbookVerificationStatus;
  final String? passbookRejectionReason;
  final String? kycStatus;
  final String? kycRejectionReason;
  final bool? isProfileComplete;
  final List<dynamic>? productsQrScanned;
  final String? createdAt;
  final String? updatedAt;

  UserModel({
    this.id,
    this.fullName,
    this.userId,
    this.phone,
    this.email,
    this.profilePick,
    this.coinsEarned,
    this.dob,
    this.address,
    this.pinCode,
    this.state,
    this.country,
    this.accountNumber,
    this.accountHolderName,
    this.bankName,
    this.ifscCode,
    this.panPhoto,
    this.panVerificationStatus,
    this.panRejectionReason,
    this.aadharPhoto,
    this.aadharVerificationStatus,
    this.aadharRejectionReason,
    this.passbookPhoto,
    this.passbookVerificationStatus,
    this.passbookRejectionReason,
    this.kycStatus,
    this.kycRejectionReason,
    this.isProfileComplete,
    this.productsQrScanned,
    this.createdAt,
    this.updatedAt,
  });

  factory UserModel.fromJson(Map<String, dynamic> json) {
    return UserModel(
      id: json['_id'],
      fullName: json['fullName'],
      userId: json['userId'],
      phone: json['phone'],
      email: json['email'],
      profilePick: json['profilePick'],
      coinsEarned: json['coinsEarned'],
      dob: json['dob'],
      address: json['address'],
      pinCode: json['pinCode'],
      state: json['state'],
      country: json['country'],
      accountNumber: json['accountNumber'],
      accountHolderName: json['accountHolderName'],
      bankName: json['bankName'],
      ifscCode: json['ifscCode'],
      panPhoto: json['panPhoto'],
      panVerificationStatus: json['panVerificationStatus'],
      panRejectionReason: json['panRejectionReason'],
      aadharPhoto: json['aadharPhoto'],
      aadharVerificationStatus: json['aadharVerificationStatus'],
      aadharRejectionReason: json['aadharRejectionReason'],
      passbookPhoto: json['passbookPhoto'],
      passbookVerificationStatus: json['passbookVerificationStatus'],
      passbookRejectionReason: json['passbookRejectionReason'],
      kycStatus: json['kycStatus'],
      kycRejectionReason: json['kycRejectionReason'],
      isProfileComplete: json['isProfileComplete'],
      productsQrScanned: json['productsQrScanned'],
      createdAt: json['createdAt'],
      updatedAt: json['updatedAt'],
    );
  }

  Map<String, dynamic> toJson() {
    return {
      '_id': id,
      'fullName': fullName,
      'userId': userId,
      'phone': phone,
      'email': email,
      'profilePick': profilePick,
      'coinsEarned': coinsEarned,
      'dob': dob,
      'address': address,
      'pinCode': pinCode,
      'state': state,
      'country': country,
      'accountNumber': accountNumber,
      'accountHolderName': accountHolderName,
      'bankName': bankName,
      'ifscCode': ifscCode,
      'panPhoto': panPhoto,
      'panVerificationStatus': panVerificationStatus,
      'panRejectionReason': panRejectionReason,
      'aadharPhoto': aadharPhoto,
      'aadharVerificationStatus': aadharVerificationStatus,
      'aadharRejectionReason': aadharRejectionReason,
      'passbookPhoto': passbookPhoto,
      'passbookVerificationStatus': passbookVerificationStatus,
      'passbookRejectionReason': passbookRejectionReason,
      'kycStatus': kycStatus,
      'kycRejectionReason': kycRejectionReason,
      'isProfileComplete': isProfileComplete,
      'productsQrScanned': productsQrScanned,
      'createdAt': createdAt,
      'updatedAt': updatedAt,
    };
  }
}
