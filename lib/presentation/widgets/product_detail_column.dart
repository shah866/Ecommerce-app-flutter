import 'package:ecommerce_app/core/utils/responsive.dart';
import 'package:ecommerce_app/data/models/category.dart';

import 'package:ecommerce_app/domain/entities/category_entity.dart';
import 'package:ecommerce_app/domain/entities/product_entity.dart';

import 'package:ecommerce_app/presentation/cubit/category_cubit/category_cubit.dart';
import 'package:ecommerce_app/presentation/cubit/category_cubit/category_state.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class ProductDetailColumn extends StatelessWidget {
  final ProductEntity product;
  final Responsive r;

 
  const ProductDetailColumn({
    super.key,
    required this.product,
    required this.r,
   
  });
   String getCategoryNameById(int id, List<CategoryEntity> categories) {
    return categories
        .firstWhere(
          (c) => c.id == id,
          orElse:
              () =>
                  Category(id: id, name: 'Unknown', slug: 'unknown', image: '').toEntity(),
        )
        .name;
  }
  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Center(
          child: Container(
            width: 40,
            height: 4,
            margin: const EdgeInsets.only(bottom: 16),
            decoration: BoxDecoration(
              color: Colors.grey[400],
              borderRadius: BorderRadius.circular(2),
            ),
          ),
        ),
        Text(
          product.title,
          style: TextStyle(
            fontSize: r.font(0.055),
            fontWeight: FontWeight.bold,
          ),
        ),
        const SizedBox(height: 12),

        Text(
          "\$${product.price.toStringAsFixed(2)}",
          style: TextStyle(
            fontSize: r.font(0.05),
            fontWeight: FontWeight.bold,
            color: Colors.green,
          ),
        ),
        const SizedBox(height: 12),
        BlocBuilder<CategoryCubit, CategoryState>(
          builder: (context, state) {
            if (state is CategoryLoading) {
              return const CircularProgressIndicator();
            } else if (state is CategoryError) {
              return Text(state.message);
            } else if (state is CategorySuccess) {
              final categoryName = getCategoryNameById(
                product.categoryId,
                state.categories,
              );
              return Text(
                "Category: $categoryName",
                style: TextStyle(
                  fontSize: r.font(0.05),
                  color: Colors.black38,
                  fontWeight: FontWeight.bold,
                ),
              );
            } else {
              return const SizedBox();
            }
          },
        ),

        const SizedBox(height: 12),
        TextButton(
          onPressed: () {},
          style: TextButton.styleFrom(
            backgroundColor: Colors.blue[100],
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(20),
            ),
          ),
          child: const Text("Description"),
        ),
        const SizedBox(height: 8),
        Text(
          product.description,
          style: TextStyle(
            fontSize: r.font(0.04),
            color: Colors.grey[700],
            height: 1.5,
            fontWeight: FontWeight.bold,
          ),
        ),
      ],
    );
  }
}
