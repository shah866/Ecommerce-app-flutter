
import 'package:ecommerce_app/domain/entities/product_entity.dart';
import 'package:ecommerce_app/presentation/widgets/form_fields.dart';
import 'package:flutter/material.dart';
import '../../../data/models/product.dart';

class ProductForm extends StatefulWidget {
  final void Function(ProductEntity product) onSubmit;

  final ProductEntity? initialProduct;

  const ProductForm({
    super.key,
    required this.onSubmit,

    this.initialProduct,
  });

  @override
  State<ProductForm> createState() => _ProductFormState();
}

class _ProductFormState extends State<ProductForm> {
  final _formKey = GlobalKey<FormState>();
  late TextEditingController _titleController;
  late TextEditingController _priceController;
  late TextEditingController _descriptionController;
  late TextEditingController _imageController;
  int? _selectedCategoryId;

  @override
  void initState() {
    super.initState();
    final p = widget.initialProduct;
    _titleController = TextEditingController(text: p?.title ?? '');
    _priceController = TextEditingController(text: p?.price.toString() ?? '');
    _descriptionController = TextEditingController(text: p?.description ?? '');
    _imageController = TextEditingController(
      text: p?.images.isNotEmpty == true ? p!.images.first : '',
    );

    _selectedCategoryId = p?.categoryId;
    }
  

  @override
  void dispose() {
    _titleController.dispose();
    _priceController.dispose();
    _descriptionController.dispose();
    _imageController.dispose();

    super.dispose();
  }

  void _submit() {
    if (_formKey.currentState!.validate() && _selectedCategoryId != null) {
      final product = Product(
        id: widget.initialProduct?.id,
        title: _titleController.text,
        description: _descriptionController.text,
        price: double.tryParse(_priceController.text) ?? 0,
        categoryId: _selectedCategoryId!,
        images: [_imageController.text],
      );
      widget.onSubmit(product.toEntity());
    }
  }

  @override
  Widget build(BuildContext context) {
    return Form(
      key: _formKey,
      child: Column(
        children: [

          FormFields(
            titleController: _titleController,
            priceController: _priceController,
            descriptionController: _descriptionController,
            imageController: _imageController,
           
            selectedCategoryId: _selectedCategoryId,
          //   onCategoryChanged:
            
          //       (val) => _selectedCategoryId = val,
          // ),
          onCategoryChanged: (val) {
  print('User selected category ID: $val');
  _selectedCategoryId = val;
},
          ),
          const SizedBox(height: 24),
          SizedBox(
            width: double.infinity,
            child: ElevatedButton(
              onPressed: _submit,
              style: ElevatedButton.styleFrom(
                backgroundColor: const Color(0xFF36618E),
                padding: const EdgeInsets.symmetric(vertical: 16),
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(24),
                ),
              ),
              child: Text(
                widget.initialProduct == null
                    ? 'Add Product'
                    : 'Update Product',
                style: const TextStyle(color: Colors.white),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
