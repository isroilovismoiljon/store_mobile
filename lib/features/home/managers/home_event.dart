
sealed class HomeEvent{}

final class HomeEventGetCategories extends HomeEvent{}
final class HomeEventGetProducts extends HomeEvent{
  final int? categoryId;
  HomeEventGetProducts({this.categoryId});
}

final class HomeEventSaveProduct extends HomeEvent{
  final int id;
  HomeEventSaveProduct({required this.id});
}
final class HomeEventUnSaveProduct extends HomeEvent{
  final int id;
  HomeEventUnSaveProduct({required this.id});
}

final class HomeEventGetSavedProducts extends HomeEvent {}
