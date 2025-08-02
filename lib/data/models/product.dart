import 'package:ecommerce_app/domain/entities/product_entity.dart';

class Product {
  final int ? id;
  final String title;
  final String description;
  final double price;
  final int categoryId;
  final List<String> images;

  Product({
    this.id,
    required this.title,
    required this.description,
    required this.price,
    required this.categoryId,
    required this.images,
  });

  factory Product.fromJson(Map<String, dynamic> json) => Product(
        id: json['id'],
        title: json['title'],
        description: json['description'],
        price: (json['price'] as num).toDouble(),
        categoryId: json['category']['id'],
        images: List<String>.from(json['images']),
      );

      //from entity

     factory Product.fromEntity(ProductEntity product) => Product(
        id: product.id,
        title: product.title,
        description: product.description,
        price: product.price,
        categoryId: product.categoryId,
        images: product.images,
      );

  Map<String, dynamic> toJson() => {
        'title': title,
        'description': description,
        'price': price,
        'categoryId': categoryId,
        'images': images,
      };


  ProductEntity toEntity() => ProductEntity(
        id: id,
        title: title,
        description: description,
        price: price,
        categoryId: categoryId,
        images: images,
      );



}
