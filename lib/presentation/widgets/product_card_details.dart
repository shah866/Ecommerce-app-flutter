import 'package:ecommerce_app/domain/entities/product_entity.dart';
import 'package:flutter/material.dart';

import '../../../core/utils/responsive.dart';

class ProductCardDetails extends StatelessWidget {
  final ProductEntity product;
  final Responsive r;
  final VoidCallback? onEdit;

  const ProductCardDetails({
    super.key,
    required this.product,
    required this.r,
    this.onEdit,
  });

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.all(r.padding(0.04)),
      child: Column(
        mainAxisSize: MainAxisSize.min,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Flexible(
            flex: 1,
            child: Text(
              product.title,
              maxLines: 1,
              overflow: TextOverflow.ellipsis,
              style: TextStyle(
                fontWeight: FontWeight.bold,
                fontSize: r.font(0.04),
              ),
            ),
          ),
          Flexible(
            flex: 1,
            child: Text(
              "\$${product.price.toStringAsFixed(2)}",
              style: TextStyle(
                color: Colors.blue,
                fontWeight: FontWeight.bold,
                fontSize: r.font(0.04),
              ),
            ),
          ),

          Flexible(
            flex: 1,
            child: TextButton(
              style: TextButton.styleFrom(
                minimumSize: Size.zero,
                padding: EdgeInsets.zero,
                tapTargetSize: MaterialTapTargetSize.shrinkWrap,
              ),

              onPressed: onEdit,
              child: Text(
                'change',
                style: TextStyle(
                  fontSize: r.font(0.038),
                  fontWeight: FontWeight.bold,
                  color: Colors.grey,
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
