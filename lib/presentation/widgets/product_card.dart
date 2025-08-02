
import 'package:ecommerce_app/domain/entities/product_entity.dart';

import 'package:ecommerce_app/presentation/cubit/category_cubit/category_cubit.dart';

import 'package:ecommerce_app/presentation/pages/product_detail_page.dart';
import 'package:ecommerce_app/presentation/widgets/custom_delete_button.dart';
import 'package:ecommerce_app/presentation/widgets/product_card_details.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../core/utils/responsive.dart';

class ProductCard extends StatelessWidget {
  final ProductEntity product;
  final VoidCallback? onEdit;

  const ProductCard({super.key, required this.product, this.onEdit});

  @override
  Widget build(BuildContext context) {
    final r = Responsive(context);

    return InkWell(
      onTap: () {
        Navigator.push(
          context,
          MaterialPageRoute(
            builder:
                (_) => MultiBlocProvider(
                  providers: [
                    BlocProvider.value(value: context.read<CategoryCubit>()),
                  ],
                  child: ProductDetailPage(product: product),
                ),
          ),
        );
      },
      child: Card(
 clipBehavior: Clip.antiAlias, 
        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(12)),
   
        child: Column(
          mainAxisSize: MainAxisSize.min,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Stack(
              children: [
                ClipRRect(
                  borderRadius: const BorderRadius.only(
                    topLeft: Radius.circular(12),
                    topRight: Radius.circular(12),
                  ),
                  child: Image.network(
                    product.images.isNotEmpty ? product.images[0] : '',
                    height: r.imageHeight(0.2),
                    width: double.infinity,
                    fit: BoxFit.cover,
                    errorBuilder:
                        (context, error, stackTrace) => Container(
                          height: r.imageHeight(0.2),
                          color: Colors.grey[300],
                          child: const Center(child: Icon(Icons.broken_image)),
                        ),
                  ),
                ),
           
              
            CustomDeleteButton(product: product),
    
          
              ],
            ),
             
             ProductCardDetails(product: product, r: r, onEdit: onEdit),
      
          ],
        ),
      ),
  
    );
  }
}
