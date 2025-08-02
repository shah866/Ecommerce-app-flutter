import 'package:ecommerce_app/core/utils/responsive.dart';
import 'package:ecommerce_app/domain/entities/product_entity.dart';


import 'package:ecommerce_app/presentation/widgets/product_detail_column.dart';
import 'package:flutter/material.dart';


class ProductDetailPage extends StatelessWidget {
  final ProductEntity product;
 

  const ProductDetailPage({super.key, required this.product});

  @override
  Widget build(BuildContext context) {
    final r = Responsive(context);
    return Scaffold(
      appBar: AppBar(
        title: const Text(
          "Product Details",
          style: TextStyle(color: Colors.white),
        ),
        iconTheme: const IconThemeData(color: Colors.white),
 backgroundColor: const Color(0xFF36618E),
      ),
      body: Stack(
        children: [
          SizedBox(
            width: double.infinity,
            height: double.infinity,
            child: Image.network(
              product.images.isNotEmpty ? product.images[0] : '',
              fit: BoxFit.cover,
              errorBuilder:
                  (_, __, ___) => Container(
                    color: Colors.grey[300],
                    child: const Center(
                      child: Icon(Icons.broken_image, size: 48),
                    ),
                  ),
            ),
          ),
          DraggableScrollableSheet(
            initialChildSize: 0.45,
            minChildSize: 0.1,
            maxChildSize: 0.9,
            builder: (context, scrollController) {
              return Container(
                padding: EdgeInsets.all(r.padding(0.04)),
                decoration: BoxDecoration(
                  color: Colors.white,
                  borderRadius: const BorderRadius.vertical(
                    top: Radius.circular(32),
                  ),
                  boxShadow: [
                    BoxShadow(
                      color: Colors.black.withOpacity(0.1),
                      blurRadius: 10,
                      offset: const Offset(0, -4),
                    ),
                  ],
                ),

                child: SingleChildScrollView(
                  controller: scrollController,
                  child:
                         ProductDetailColumn(
                          product: product,
                          r: r,
                         
                       
                        ),
                  ),
              );
            },
          ),
        ],
      ),
    );
  }
}
