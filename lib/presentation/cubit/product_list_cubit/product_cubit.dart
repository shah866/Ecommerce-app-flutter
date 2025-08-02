
import 'package:ecommerce_app/domain/entities/product_entity.dart';
import 'package:ecommerce_app/domain/repositories/product_repository.dart';

import 'package:ecommerce_app/presentation/cubit/product_list_cubit/product_state.dart';

import 'package:flutter_bloc/flutter_bloc.dart';

class ProductCubit extends Cubit<ProductState> {
 
 final ProductRepository productRepository;

  ProductCubit(this.productRepository) : super(ProductInitial());



  void fetchProducts() async {
  emit(ProductLoading());
  try {
    final List<ProductEntity> products = await  productRepository.getAllProducts();
    emit(ProductSuccess(products.reversed.toList()));
  }
  on CustomeExecption catch (e) {
    emit(ProductError(e.message));
  
}
}


}
class CustomeExecption implements Exception {
  final String message;
  CustomeExecption(this.message);
}