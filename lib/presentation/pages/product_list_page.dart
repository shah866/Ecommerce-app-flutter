import 'package:ecommerce_app/core/dependency_injuction/injection_container.dart';
import 'package:ecommerce_app/domain/repositories/category_repository.dart';
import 'package:ecommerce_app/domain/repositories/product_repository.dart';

import 'package:ecommerce_app/presentation/cubit/product_list_cubit/product_cubit.dart';

import 'package:ecommerce_app/presentation/cubit/category_cubit/category_cubit.dart';

import 'package:ecommerce_app/presentation/widgets/product_list_view.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class ProductListPage extends StatelessWidget {
  const ProductListPage({super.key});
  @override
  Widget build(BuildContext context) {
    return MultiBlocProvider(
      providers: [
        BlocProvider(
          create:
              (_) =>
                  ProductCubit(serviceLocator<ProductRepository>())
                    ..fetchProducts(),
        ),
        BlocProvider(
          create:
              (_) =>
                  CategoryCubit(serviceLocator<CategoryRepository>())
                    ..fetchCategories(),
        ),
     
      ],
      child: const ProductListView(),
    );
  }
}
