import 'package:ecommerce_app/domain/repositories/category_repository.dart';
import 'package:ecommerce_app/presentation/cubit/category_cubit/category_state.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:ecommerce_app/core/errors/custom_exception.dart';

class CategoryCubit extends Cubit<CategoryState> {
  final CategoryRepository categoryRepository;

  CategoryCubit(this.categoryRepository) : super(CategoryInitial());

  void fetchCategories() async {
    print(' CategoryCubit: Starting to fetch categories...');
    emit(CategoryLoading());

    try {
      final categories = await categoryRepository.getAllCategories();
      print('CategoryCubit: Successfully fetched ${categories.length} categories.');
      emit(CategorySuccess(categories));
    } on CustomeExecption catch (e) {
      print(' CategoryCubit: Failed to fetch categories: ${e.message}');
      emit(CategoryError(e.message));
    } catch (e) {
      print(' CategoryCubit: Unexpected error: $e');
      emit(CategoryError('Unexpected error: $e'));
    }
  }
}
