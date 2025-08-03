import 'package:ecommerce_app/domain/entities/product_entity.dart';
import 'package:ecommerce_app/domain/repositories/product_repository.dart';
import 'package:ecommerce_app/core/errors/custom_exception.dart';
import 'package:ecommerce_app/presentation/cubit/edit_add_cubit/edit_add_product_state.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class EditAddProductCubit extends Cubit<EditAddProductState> {
  final ProductRepository productRepository;

  EditAddProductCubit({required this.productRepository})
      : super(EditAddProductInitial());

  Future<void> addProduct(ProductEntity product) async {
    print(' EditAddProductCubit: Starting to add product: ${product.title}');
    emit(EditAddProductLoading());

    try {
      final newProduct = await productRepository.addProduct(product);
      print(' EditAddProductCubit: Product added successfully: ${newProduct.title}');

      emit(EditAddProductSuccess(newProduct));
    } on CustomeExecption catch (e) {
      print(' EditAddProductCubit: Failed to add product: ${e.message}');
      emit(EditAddProductError(e.message));
    } catch (e) {
      print(' EditAddProductCubit: Unexpected error: $e');
      emit(EditAddProductError('Unexpected error: $e'));
    }
  }

  Future<void> updateProduct(int id, Map<String, dynamic> updates) async {
    print(' EditAddProductCubit: Starting update for product ID: $id with data: $updates');
    emit(EditAddProductLoading());

    try {
      final updatedProduct = await productRepository.updateProduct(id, updates);
      print(' EditAddProductCubit: Product updated successfully: ${updatedProduct.title}');

      emit(EditAddProductSuccess(updatedProduct));
    } on CustomeExecption catch (e) {
      print('EditAddProductCubit: Failed to update product: ${e.message}');
      emit(EditAddProductError(e.message));
    } catch (e) {
      print(' EditAddProductCubit: Unexpected error: $e');
      emit(EditAddProductError('Unexpected error: $e'));
    }
  }
}
