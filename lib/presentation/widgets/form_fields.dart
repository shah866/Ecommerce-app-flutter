import 'package:ecommerce_app/presentation/cubit/category_cubit/category_cubit.dart';
import 'package:ecommerce_app/presentation/cubit/category_cubit/category_state.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import 'category_dropdown.dart';

class FormFields extends StatelessWidget {
  final TextEditingController titleController;
  final TextEditingController priceController;
  final TextEditingController descriptionController;
  final TextEditingController imageController;

  final int? selectedCategoryId;
  final ValueChanged<int?> onCategoryChanged;

  const FormFields({
    super.key,
    required this.titleController,
    required this.priceController,
    required this.descriptionController,
    required this.imageController,

    required this.selectedCategoryId,
    required this.onCategoryChanged,
  });

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        TextFormField(
          controller: titleController,
          decoration: const InputDecoration(labelText: 'Title'),
          validator: (val) => val == null || val.isEmpty ? 'Required' : null,
        ),
        const SizedBox(height: 16),
        TextFormField(
          controller: priceController,
          decoration: const InputDecoration(labelText: 'Price'),
          keyboardType: TextInputType.number,
          validator:
              (val) =>
                  val == null || double.tryParse(val) == null
                      ? 'Enter valid price'
                      : null,
        ),
        const SizedBox(height: 16),
        TextFormField(
          controller: descriptionController,
          decoration: const InputDecoration(labelText: 'Description'),
          validator: (val) => val == null || val.isEmpty ? 'Required' : null,
        ),
        const SizedBox(height: 16),
        TextFormField(
          controller: imageController,
          decoration: const InputDecoration(labelText: 'Image URL'),
          validator: (val) => val == null || val.isEmpty ? 'Required' : null,
        ),
        const SizedBox(height: 16),

        BlocBuilder<CategoryCubit, CategoryState>(
          builder: (context, state) {
            if (state is CategoryLoading) {
              return const CircularProgressIndicator();
            } else if (state is CategoryError) {
              return Text(state.message);
            } else if (state is CategorySuccess) {
              return CategoryDropdown(
                categories: state.categories,
                initialCategoryId: selectedCategoryId,
                onChanged: onCategoryChanged,
              );
            } else {
              return const SizedBox();
            }
          },
        ),
      ],
    );
  }
}
