
class ForgotPasswordModel {
  final String email;
  final String? otpCode;
  final String? password;

  ForgotPasswordModel({required this.email, required this.otpCode, required this.password});
  Map<String, dynamic> toJsonOnlyEmail() =>{
    'email': email
  };
  Map<String, dynamic> toJsonVerify() =>{
    'email': email,
    'code': otpCode
  };
  Map<String, dynamic> toJsonReset() =>{
    'email': email,
    'code': otpCode,
    'password': password
  };
}