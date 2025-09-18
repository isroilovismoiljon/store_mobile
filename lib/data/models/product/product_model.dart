class ProductModel {
  final int id;
  final int categoryId;
  final String title;
  final String image;
  final num price;
  final bool isLiked;
  final num discount;

  ProductModel({
    required this.categoryId,
    required this.image,
    required this.price,
    required this.isLiked,
    required this.discount,
    required this.id,
    required this.title,
  });

  factory ProductModel.fromJson(Map<String, dynamic> json) {
    return ProductModel(
      id: json['id'],
      title: json['title'],
      categoryId: json['categoryId'],
      discount: json['discount'],
      image: json['image'],
      isLiked: json['isLiked'],
      price: json['price']
    );
  }
}
