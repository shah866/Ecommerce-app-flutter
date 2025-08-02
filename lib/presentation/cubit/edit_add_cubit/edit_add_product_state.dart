
import 'package:ecommerce_app/domain/entities/product_entity.dart';

abstract class EditAddProductState {}

class EditAddProductInitial extends EditAddProductState {}

class EditAddProductLoading extends EditAddProductState {}

class EditAddProductSuccess extends EditAddProductState {
final ProductEntity product;
EditAddProductSuccess(this.product);
}

class EditAddProductError extends EditAddProductState {
  final String message;
  EditAddProductError(this.message);
}
