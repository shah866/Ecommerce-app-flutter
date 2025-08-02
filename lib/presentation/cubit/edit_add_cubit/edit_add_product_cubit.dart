import 'package:ecommerce_app/domain/entities/product_entity.dart';
import 'package:ecommerce_app/domain/repositories/product_repository.dart';

import 'package:ecommerce_app/presentation/cubit/edit_add_cubit/edit_add_product_state.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class EditAddProductCubit extends Cubit<EditAddProductState> {
  final ProductRepository productRepository;

  EditAddProductCubit({
    required this.productRepository,
  }) : super(EditAddProductInitial());
  Future<void> addProduct(ProductEntity product) async {
    emit(EditAddProductLoading());
    try {
      final newProduct = await  productRepository.addProduct(product);

      emit(EditAddProductSuccess(newProduct));
    } on CustomeExecption catch (e) {
      emit(EditAddProductError(e.message));
    }
  }

  Future<void> updateProduct(int id, Map<String, dynamic> updates) async {
    emit(EditAddProductLoading());
    try {
      final updatedProduct = await productRepository.updateProduct(id, updates);

      emit(EditAddProductSuccess(updatedProduct));
    } on CustomeExecption catch (e) {
       emit(EditAddProductError(e.message));
    }
  }
}
class CustomeExecption implements Exception {
  final String message;
  CustomeExecption(this.message);
}
