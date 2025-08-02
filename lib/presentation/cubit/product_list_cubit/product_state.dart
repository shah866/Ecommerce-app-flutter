
import 'package:ecommerce_app/domain/entities/product_entity.dart';

abstract class ProductState {}

class ProductInitial extends ProductState {}

class ProductLoading extends ProductState {}

class ProductSuccess extends ProductState {
  final List<ProductEntity> products;
  ProductSuccess(this.products);
}

class ProductError extends ProductState {
  final String message;
  ProductError(this.message);
}
