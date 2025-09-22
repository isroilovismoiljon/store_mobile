
class ProductDetailsModel {
  final int id;
  final String title;
  final String description;
  final num price;
  final bool isLiked;
  final List<ProductImage> productImages;
  final List<ProductSize> productSizes;
  final int reviewsCount;
  final num rating;

  ProductDetailsModel({
    required this.id,
    required this.title,
    required this.description,
    required this.price,
    required this.isLiked,
    required this.productImages,
    required this.productSizes,
    required this.reviewsCount,
    required this.rating,
  });

  factory ProductDetailsModel.fromJson(Map<String, dynamic> json) => ProductDetailsModel(
    id: json["id"],
    title: json["title"],
    description: json["description"],
    price: json["price"],
    isLiked: json["isLiked"],
    productImages: List<ProductImage>.from(json["productImages"].map((x) => ProductImage.fromJson(x))),
    productSizes: List<ProductSize>.from(json["productSizes"].map((x) => ProductSize.fromJson(x))),
    reviewsCount: json["reviewsCount"],
    rating: json["rating"],
  );
}

class ProductImage {
  final int id;
  final String image;

  ProductImage({
    required this.id,
    required this.image,
  });

  factory ProductImage.fromJson(Map<String, dynamic> json) => ProductImage(
    id: json["id"],
    image: json["image"],
  );
}

class ProductSize {
  final int id;
  final String title;

  ProductSize({
    required this.id,
    required this.title,
  });

  factory ProductSize.fromJson(Map<String, dynamic> json) => ProductSize(
    id: json["id"],
    title: json["title"],
  );
}