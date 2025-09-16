import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:store_mobile/data/repositories/category_repository.dart';
import 'package:store_mobile/features/common/enums/Status.dart';
import 'package:store_mobile/features/home/managers/home_state.dart';

class HomeCubit extends Cubit<HomeState>{
  final CategoryRepository _categoryRepository;

  HomeCubit({required CategoryRepository categoryRepository}) : _categoryRepository = categoryRepository,
  super(HomeState.initial()){
    getCategories();
  }

  Future<void> getCategories()async{
    emit(state.copyWith(status: Status.loading, errorMessage: null));
    final result = await _categoryRepository.getCategories();

    result.fold((error) {
      emit(state.copyWith(status: Status.error, errorMessage: error.toString()));
    }, (value) {
      emit(state.copyWith(status: Status.success, errorMessage: null, categories: value));
    },);
  }
}
