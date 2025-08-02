
import 'package:ecommerce_app/domain/repositories/category_repository.dart';

import 'package:ecommerce_app/presentation/cubit/category_cubit/category_state.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class CategoryCubit extends Cubit<CategoryState> {
  final CategoryRepository categoryRepository;

  CategoryCubit(this.categoryRepository) : super(CategoryInitial());

  void fetchCategories() async {
    emit(CategoryLoading());
    try {
      final categories = await categoryRepository.getAllCategories();;
      emit(CategorySuccess(categories));
    }on CustomeExecption catch (e) {
      emit(CategoryError(e.message));
    }
  }
}
class CustomeExecption implements Exception {
  final String message;
  CustomeExecption(this.message);
}
