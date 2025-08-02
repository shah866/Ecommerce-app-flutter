
import 'package:ecommerce_app/domain/entities/product_entity.dart';

abstract class ProductRepository {
  Future<List<ProductEntity>> getAllProducts();
  Future<ProductEntity> addProduct(ProductEntity product); 
  Future<void> deleteProduct(int id);
  Future<ProductEntity> updateProduct(int id, Map<String, dynamic> updates);
  Future<ProductEntity> getProductById(int id);
}
