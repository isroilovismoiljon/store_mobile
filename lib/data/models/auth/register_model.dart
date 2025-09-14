class RegisterModel {
  final String fullName, email, password;

  RegisterModel({
    required this.fullName,
    required this.email,
    required this.password,
  });

  Map<String, dynamic> toJson() => {
    "fullName": fullName,
    "email": email,
    "password": password
  };
}
