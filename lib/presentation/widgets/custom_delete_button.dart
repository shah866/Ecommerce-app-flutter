import 'package:ecommerce_app/core/dependency_injuction/injection_container.dart';
import 'package:ecommerce_app/domain/entities/product_entity.dart';
import 'package:ecommerce_app/domain/repositories/product_repository.dart';
import 'package:ecommerce_app/presentation/cubit/delete_cubit/delete_product_cubit.dart';
import 'package:ecommerce_app/presentation/cubit/delete_cubit/delete_product_state.dart';
import 'package:ecommerce_app/presentation/cubit/product_list_cubit/product_cubit.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class CustomDeleteButton extends StatelessWidget {
  final ProductEntity product;

  const CustomDeleteButton({super.key, required this.product});

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (_) => DeleteProductCubit(serviceLocator<ProductRepository>()),
      child: BlocConsumer<DeleteProductCubit, DeleteProductState>(
        listener: (context, state) {
          if (state is DeleteProductSuccess) {
            ScaffoldMessenger.of(context).showSnackBar(
              SnackBar(
                content: Text(
                  'Product "${product.title}" deleted successfully!',
                ),
                backgroundColor: Colors.green,
              ),
            );
   
            // context.read<ProductCubit>().fetchProducts();
              Future.delayed(Duration(milliseconds: 2), () {
               context.read<ProductCubit>().fetchProducts();
    });
          } else if (state is DeleteProductError) {
            ScaffoldMessenger.of(context).showSnackBar(
              SnackBar(
                content: Text('Failed to delete: ${state.message}'),
                backgroundColor: Colors.red,
              ),
            );
          }
        },
        builder: (context, state) {
          final isDeleting =
              state is DeleteProductLoading && state.productId == product.id;

          return Positioned(
            top: 6,
            right: 6,
            child: CircleAvatar(
              radius: 16,
              backgroundColor: Colors.white.withOpacity(0.8),
              child:
                  isDeleting
                      ? const SizedBox(
                        width: 16,
                        height: 16,
                        child: CircularProgressIndicator(
                          strokeWidth: 2.0,
                          valueColor: AlwaysStoppedAnimation<Color>(Colors.red),
                        ),
                      )
                      : IconButton(
                        padding: EdgeInsets.zero,
                        icon: const Icon(
                          Icons.delete,
                          size: 18,
                          color: Colors.red,
                        ),
                        onPressed: () {
                          showDialog(
                            context: context,
                            builder:
                                (ctx) => AlertDialog(
                                  title: const Text("Delete Product"),
                                  content: Text(
                                    "Are you sure you want to delete \"${product.title}\"?",
                                  ),
                                  actions: [
                                    TextButton(
                                      onPressed: () => Navigator.of(ctx).pop(),
                                      child: const Text("Cancel"),
                                    ),
                                    TextButton(
                                      onPressed: () {
                                        Navigator.of(ctx).pop();
                                        context
                                            .read<DeleteProductCubit>()
                                            .deleteProduct(product);
                                      },
                                      style: TextButton.styleFrom(
                                        foregroundColor: Colors.red,
                                      ),
                                      child: const Text("Delete"),
                                    ),
                                  ],
                                ),
                          );
                        },
                      ),
            ),
          );
          
        },
      ),
    );
  }
}

