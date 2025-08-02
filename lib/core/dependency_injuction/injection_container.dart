import 'package:ecommerce_app/data/repositories/category_repository_impl.dart';
import 'package:ecommerce_app/domain/repositories/category_repository.dart';
import 'package:ecommerce_app/domain/repositories/product_repository.dart';
import 'package:get_it/get_it.dart';
import 'package:ecommerce_app/data/repositories/product_repository_impl.dart';
import 'package:ecommerce_app/core/services/api_service.dart';



final serviceLocator = GetIt.instance;

void setupServiceLocator() {
  serviceLocator.registerLazySingleton<ApiService>(() => ApiService());

  // Repositories
  serviceLocator.registerLazySingleton<ProductRepository>(() => ProductRepositoryImpl(serviceLocator<ApiService>()));
  serviceLocator.registerLazySingleton<CategoryRepository>(() => CategoryRepositoryImpl(serviceLocator<ApiService>()));
  
}
