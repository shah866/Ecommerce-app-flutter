
import 'package:ecommerce_app/domain/entities/category_entity.dart';

abstract class CategoryRepository {
  Future<List<CategoryEntity>> getAllCategories();
  // String getCategoryNameById(int id, List<Category> categories);
}
