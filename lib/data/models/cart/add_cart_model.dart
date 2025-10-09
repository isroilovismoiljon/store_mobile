class AddCartModel {
  final int productId, sizeId;

  AddCartModel({
    required this.productId,
    required this.sizeId,
  });

  Map<String, dynamic> toJson() {
    return {
      "productId": productId,
      "sizeId": sizeId,
    };
  }
}
