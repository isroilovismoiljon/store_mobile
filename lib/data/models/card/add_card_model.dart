class AddCardModel {
  final String cardNumber, expiryDate, securityCode;

  AddCardModel({
    required this.cardNumber,
    required this.expiryDate,
    required this.securityCode,
  });

  Map<String, dynamic> toJson() {
    return {
      "cardNumber": cardNumber,
      "expiryDate": expiryDate,
      "securityCode": securityCode,
    };
  }
}
