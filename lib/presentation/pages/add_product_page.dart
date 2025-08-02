import 'package:ecommerce_app/core/dependency_injuction/injection_container.dart';
import 'package:ecommerce_app/domain/repositories/product_repository.dart';

import 'package:ecommerce_app/presentation/cubit/edit_add_cubit/edit_add_product_cubit.dart';
import 'package:ecommerce_app/presentation/cubit/edit_add_cubit/edit_add_product_state.dart';
import 'package:ecommerce_app/presentation/widgets/product_form.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class AddProductPage extends StatelessWidget {
  const AddProductPage({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (_) => EditAddProductCubit(
        productRepository: serviceLocator<ProductRepository>(),
      ),
      child: BlocConsumer<EditAddProductCubit, EditAddProductState>(
        listener: (context, state) {
          if (state is EditAddProductSuccess) {
            ScaffoldMessenger.of(context).showSnackBar(
              const SnackBar(
                content: Text('Product successfully added!'),
                backgroundColor: Colors.green,
              ),
            );
            Navigator.pop(context, true);
          } else if (state is EditAddProductError) {
            ScaffoldMessenger.of(context).showSnackBar(
              SnackBar(
                content: Text(state.message),
                backgroundColor: Colors.red,
              ),
            );
          }
        },
        builder: (context, state) {
          return Scaffold(
            appBar: AppBar(
              title: const Text("Add Product", style: TextStyle(color: Colors.white)),
              iconTheme: const IconThemeData(color: Colors.white),
              backgroundColor: const Color(0xFF36618E),
            ),
            body: Stack(
              children: [
                Padding(
                  padding: const EdgeInsets.all(16.0),
                  child: ProductForm(
                    onSubmit: (product) {
                      context.read<EditAddProductCubit>().addProduct(product);
                    },
                  ),
                ),
                if (state is EditAddProductLoading)
                  Container(
                    color: Colors.black.withOpacity(0.5),
                    child: const Center(child: CircularProgressIndicator()),
                  ),
              ],
            ),
          );
        },
      ),
    );
  }
}
