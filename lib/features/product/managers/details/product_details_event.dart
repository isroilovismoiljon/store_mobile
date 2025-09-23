
sealed class ProductDetailsEvent {}

final class ProductDetailsGetProductDetails extends ProductDetailsEvent{
  final int id;
  ProductDetailsGetProductDetails({required this.id});
}

final class ProductDetailsSaveProduct extends ProductDetailsEvent{
  final int id;
  ProductDetailsSaveProduct({required this.id});
}

final class ProductDetailsUnSaveProduct extends ProductDetailsEvent{
  final int id;
  ProductDetailsUnSaveProduct({required this.id});
}