import 'package:ecommerce_app/core/services/api_service.dart';
import 'package:ecommerce_app/domain/entities/product_entity.dart';
import 'package:ecommerce_app/domain/repositories/product_repository.dart';
import '../models/product.dart';

class ProductRepositoryImpl implements ProductRepository {
  final ApiService _apiService;

  ProductRepositoryImpl(this._apiService); 

  @override
  Future<List<ProductEntity>> getAllProducts() async {
    print(' Repository: Fetching all products...');
    final response = await _apiService.get('products');
    print(' Repository: Received ${response.data.length} products.');
    
    return (response.data as List)
        .map((json) => Product.fromJson(json).toEntity())
        .toList();
  }

  @override
  Future<ProductEntity> getProductById(int id) async {
    print(' Repository: Fetching product by ID: $id');
    final res = await _apiService.get('products/$id');
    print(' Repository: Product data received: ${res.data}');
    
    return Product.fromJson(res.data).toEntity();
  }

  @override
  Future<ProductEntity> addProduct(ProductEntity product) async {
    print(' Repository: Adding product: ${product.title}');
    final response = await _apiService.post(
      'products',
      data: Product.fromEntity(product).toJson(),
    );
    print('Repository: Product added successfully: ${response.data}');
    
    return Product.fromJson(response.data).toEntity();
  }

  @override
  Future<ProductEntity> updateProduct(int id, Map<String, dynamic> updates) async {
    print('Repository: Updating product ID $id with data: $updates');
    final response = await _apiService.put('products/$id', data: updates);
    print(' Repository: Product updated: ${response.data}');
    
    return Product.fromJson(response.data).toEntity();
  }

  @override
  Future<void> deleteProduct(int id) async {
    print(' Repository: Deleting product with ID: $id');
    await _apiService.delete('products/$id');
    print('Repository: Product deleted successfully.');
  }
}
