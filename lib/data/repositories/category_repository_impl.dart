import 'package:ecommerce_app/core/services/api_service.dart';
import 'package:ecommerce_app/data/models/category.dart';
import 'package:ecommerce_app/domain/entities/category_entity.dart';
import 'package:ecommerce_app/domain/repositories/category_repository.dart';

class CategoryRepositoryImpl implements CategoryRepository {
  final ApiService _apiService;
  
  CategoryRepositoryImpl(this._apiService);

  @override
  Future<List<CategoryEntity>> getAllCategories() async {
     final response = await _apiService.get('categories');
    return (response.data as List)
        .map((json) => Category.fromJson(json).toEntity())
        .toList();
  }
// @override
//    String getCategoryNameById(int id, List<Category> categories) {
//     return categories
//         .firstWhere(
//           (c) => c.id == id,
//           orElse:
//               () =>
//                   Category(id: id, name: 'Unknown', slug: 'unknown', image: ''),
//         )
//         .name;
//   }
}