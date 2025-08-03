import 'package:ecommerce_app/core/errors/custom_exception.dart';
import 'package:ecommerce_app/domain/entities/product_entity.dart';
import 'package:ecommerce_app/domain/repositories/product_repository.dart';
import 'package:ecommerce_app/presentation/cubit/product_list_cubit/product_state.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class ProductCubit extends Cubit<ProductState> {
  final ProductRepository productRepository;

  ProductCubit(this.productRepository) : super(ProductInitial());

  void fetchProducts() async {
    print(' ProductCubit: Starting to fetch products...');
    emit(ProductLoading());

    try {
      final List<ProductEntity> products = await productRepository.getAllProducts();
      print(' ProductCubit: Successfully fetched ${products.length} products.');
      emit(ProductSuccess(products.reversed.toList()));
    } on CustomeExecption catch (e) {
      print(' ProductCubit: Failed to fetch products: ${e.message}');
      emit(ProductError(e.message));
    } catch (e) {
      print(' ProductCubit: Unexpected error: $e');
      emit(ProductError('Unexpected error: $e'));
    }
  }
}
