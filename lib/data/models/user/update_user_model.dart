class UpdateUserModel {
  final String gender;
  final String fullName;
  final String email;
  final String phoneNumber;
  final String birthDate;

  UpdateUserModel({
    required this.gender,
    required this.fullName,
    required this.email,
    required this.phoneNumber,
    required this.birthDate,
  });

  factory UpdateUserModel.fromJson(Map<String, dynamic> json) => UpdateUserModel(
    gender: json["gender"],
    fullName: json["fullName"],
    email: json["email"],
    phoneNumber: json["phoneNumber"],
    birthDate: json["birthDate"],
  );

  Map<String, dynamic> toJson() => {
    "gender": gender,
    "fullName": fullName,
    "email": email,
    "phoneNumber": phoneNumber,
    "birthDate": birthDate,
  };
}
