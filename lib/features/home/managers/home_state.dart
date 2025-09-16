import 'package:equatable/equatable.dart';
import 'package:store_mobile/data/models/category/category_model.dart';
import 'package:store_mobile/features/common/enums/Status.dart';

class HomeState extends Equatable{
  final List<CategoryModel> categories;
  final Status status;
  final String? errorMessage;

  const HomeState({required this.errorMessage, required this.status, required this.categories});
  HomeState copyWith({List<CategoryModel>? categories, Status? status, String? errorMessage}) =>
      HomeState(categories: categories ?? this.categories, status: status ?? this.status, errorMessage: errorMessage ?? this.errorMessage);

factory HomeState.initial() =>HomeState(categories: [], status: Status.idle, errorMessage: null);

  @override
  List<Object?> get props => [categories, status, errorMessage];
}