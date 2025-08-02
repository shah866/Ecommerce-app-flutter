import 'package:ecommerce_app/presentation/cubit/category_cubit/category_cubit.dart';
import 'package:ecommerce_app/presentation/cubit/product_list_cubit/product_cubit.dart';
import 'package:ecommerce_app/presentation/cubit/product_list_cubit/product_state.dart';
import 'package:ecommerce_app/presentation/pages/add_product_page.dart';
import 'package:ecommerce_app/presentation/pages/edit_product_page.dart';
import 'package:ecommerce_app/presentation/widgets/product_card.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class ProductListView extends StatelessWidget {
  const ProductListView({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text(
          "E-Commerce App",
          style: TextStyle(color: Colors.white),
        ),
        backgroundColor: const Color(0xFF36618E),
        actions: [
          IconButton(
            color: Colors.white,
            icon: const Icon(Icons.refresh),
            onPressed: () {
              context.read<ProductCubit>().fetchProducts();
            },
          ),
        ],
      ),
      body: BlocBuilder<ProductCubit, ProductState>(
        builder: (context, state) {
          if (state is ProductLoading) {
            return const Center(child: CircularProgressIndicator());
          } else if (state is ProductError) {
            return Center(child: Text(state.message));
          } else if (state is ProductSuccess) {
            return Padding(
              padding: const EdgeInsets.all(8),
              child: GridView.builder(
                itemCount: state.products.length,
                gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                  crossAxisCount: 2,
                  mainAxisSpacing: 12,
                  crossAxisSpacing: 12,
                  childAspectRatio: 0.73,
                ),
                itemBuilder: (context, index) {
                  final product = state.products[index];
                  return ProductCard(
                    product: product,
                    onEdit: () {
                      Navigator.push(
                        context,
                        MaterialPageRoute(
                          builder:
                              (_) => MultiBlocProvider(
                                providers: [
                              
                                  BlocProvider.value(
                                    value: context.read<CategoryCubit>(),
                                  ),
                                ],
                                child: EditProductPage(product: product),
                              ),
                        ),
                      ).then((value) {
                         if (value) {
                     context.read<ProductCubit>().fetchProducts();
                            }
                        
                      });
                    },
                  );
                },
              ),
            );
          }
          return const SizedBox();
        },
      ),
      floatingActionButton: FloatingActionButton(
        backgroundColor: const Color(0xFFD0E4FF),

        onPressed: () {
          Navigator.push(
            context,
            MaterialPageRoute(
              builder:
                  (_) => MultiBlocProvider(
                    providers: [
                  
                      BlocProvider.value(value: context.read<CategoryCubit>()),
                    ],
                    child: const AddProductPage(),
                  ),
            ),
          ).then((value) {
            if (value) {
              context.read<ProductCubit>().fetchProducts();
            }
          });
        },
        child: const Icon(Icons.add),
      ),
    );
  }
}
