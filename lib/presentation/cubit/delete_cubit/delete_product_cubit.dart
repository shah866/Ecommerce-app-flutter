import 'package:ecommerce_app/domain/entities/product_entity.dart';
import 'package:ecommerce_app/domain/repositories/product_repository.dart';
import 'package:ecommerce_app/presentation/cubit/delete_cubit/delete_product_state.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:ecommerce_app/core/errors/custom_exception.dart';
class DeleteProductCubit extends Cubit<DeleteProductState> {
  final ProductRepository productRepository;

  DeleteProductCubit(this.productRepository) : super(DeleteProductInitial());

  Future<void> deleteProduct(ProductEntity product) async {
    emit(DeleteProductLoading(product.id!));
    try {
      await productRepository.deleteProduct(product.id!);

      emit(DeleteProductSuccess(product));
       print(' DeleteProductCubit: Successfully deleted product: ${product.id}');
    } on CustomeExecption catch (e) {
      print(' DeleteProductCubit: Error deleting product: $e');
      emit(DeleteProductError(e.message));
    }
  }
}

