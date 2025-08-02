import 'package:ecommerce_app/domain/entities/product_entity.dart';

abstract class DeleteProductState {}

class DeleteProductInitial extends DeleteProductState {}

class DeleteProductLoading extends DeleteProductState {
  final int productId;
  DeleteProductLoading(this.productId);
}

class DeleteProductSuccess extends DeleteProductState {
  final ProductEntity product;
  DeleteProductSuccess(this.product);
}

class DeleteProductError extends DeleteProductState {
  final String message;
  DeleteProductError(this.message);
}
