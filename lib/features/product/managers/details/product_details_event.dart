
sealed class ProductDetailsEvent {}

final class ProductDetailsGetProductDetails extends ProductDetailsEvent{
  final int id;
  ProductDetailsGetProductDetails({required this.id});
}