class ResetPasswordModel {
  final String email;
  final String? otpCode;
  final String newPassword;

  ResetPasswordModel({required this.newPassword, required this.email, required this.otpCode});
  Map<String, dynamic> toJson() =>{
    'email': email,
    'code': otpCode,
    'password': newPassword
  };
}
