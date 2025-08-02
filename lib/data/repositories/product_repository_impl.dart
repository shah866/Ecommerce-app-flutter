import 'package:ecommerce_app/core/services/api_service.dart';
import 'package:ecommerce_app/domain/entities/product_entity.dart';
import 'package:ecommerce_app/domain/repositories/product_repository.dart';
import '../models/product.dart';


class ProductRepositoryImpl implements ProductRepository {
  final ApiService _apiService;

  ProductRepositoryImpl(this._apiService); 

  @override
  Future<List<ProductEntity>> getAllProducts() async {
    final response = await _apiService.get('products');
    return (response.data as List)
        .map((json) => Product.fromJson(json).toEntity())
        .toList();
  }

  @override
  Future<ProductEntity> getProductById(int id) async {
    final res = await _apiService.get('products/$id');
    return Product.fromJson(res.data).toEntity();
  }

  @override
  Future<ProductEntity> addProduct(ProductEntity product) async {
    final response = await _apiService.post(
      'products',
      data: Product.fromEntity(
       product
      ).toJson(),
    );
    return Product.fromJson(response.data).toEntity();
  }

  @override
  Future<ProductEntity> updateProduct(int id, Map<String, dynamic> updates) async {
      final response= await _apiService.put('products/$id', data: updates);
       return Product.fromJson(response.data).toEntity();
  }

  @override
  Future<void> deleteProduct(int id) async {
    await _apiService.delete('products/$id');
  }
}
