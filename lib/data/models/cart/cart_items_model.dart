class CartModel {
  final List<Item> items;
  final int subTotal;
  final int vat;
  final int shippingFee;
  final int total;

  CartModel({
    required this.items,
    required this.subTotal,
    required this.vat,
    required this.shippingFee,
    required this.total,
  });

  factory CartModel.fromJson(Map<String, dynamic> json) => CartModel(
    items: List<Item>.from(json["items"].map((x) => Item.fromJson(x))),
    subTotal: json["subTotal"],
    vat: json["vat"],
    shippingFee: json["shippingFee"],
    total: json["total"],
  );

  Map<String, dynamic> toJson() => {
    "items": List<dynamic>.from(items.map((x) => x.toJson())),
    "subTotal": subTotal,
    "vat": vat,
    "shippingFee": shippingFee,
    "total": total,
  };
}

class Item {
  final int id;
  final int productId;
  final String title;
  final String size;
  final int price;
  final String image;
  final int quantity;

  Item({
    required this.id,
    required this.productId,
    required this.title,
    required this.size,
    required this.price,
    required this.image,
    required this.quantity,
  });

  factory Item.fromJson(Map<String, dynamic> json) => Item(
    id: json["id"],
    productId: json["productId"],
    title: json["title"],
    size: json["size"],
    price: json["price"],
    image: json["image"],
    quantity: json["quantity"],
  );

  Map<String, dynamic> toJson() => {
    "id": id,
    "productId": productId,
    "title": title,
    "size": size,
    "price": price,
    "image": image,
    "quantity": quantity,
  };
}