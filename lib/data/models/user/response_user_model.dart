class ResponseUserModel {
  final int id;
  final String fullName;
  final String email;
  final String phoneNumber;
  final String gender;
  final DateTime birthDate;

  ResponseUserModel({
    required this.id,
    required this.fullName,
    required this.email,
    required this.phoneNumber,
    required this.gender,
    required this.birthDate,
  });

  factory ResponseUserModel.fromJson(Map<String, dynamic> json) => ResponseUserModel(
    id: json["id"],
    fullName: json["fullName"],
    email: json["email"],
    phoneNumber: json["phoneNumber"],
    gender: json["gender"],
    birthDate: DateTime.parse(json["birthDate"]),
  );

  Map<String, dynamic> toJson() => {
    "id": id,
    "fullName": fullName,
    "email": email,
    "phoneNumber": phoneNumber,
    "gender": gender,
    "birthDate": "${birthDate.year.toString().padLeft(4, '0')}-${birthDate.month.toString().padLeft(2, '0')}-${birthDate.day.toString().padLeft(2, '0')}",
  };
}
