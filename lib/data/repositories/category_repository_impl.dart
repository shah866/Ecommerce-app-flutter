import 'package:ecommerce_app/core/services/api_service.dart';
import 'package:ecommerce_app/data/models/category.dart';
import 'package:ecommerce_app/domain/entities/category_entity.dart';
import 'package:ecommerce_app/domain/repositories/category_repository.dart';

class CategoryRepositoryImpl implements CategoryRepository {
  final ApiService _apiService;

  CategoryRepositoryImpl(this._apiService);

  @override
  Future<List<CategoryEntity>> getAllCategories() async {
    print(' Repository: Fetching all categories...');
    
    final response = await _apiService.get('categories');

    print(' Repository: Received ${response.data.length} categories.');

    return (response.data as List)
        .map((json) => Category.fromJson(json).toEntity())
        .toList();
  }
}
