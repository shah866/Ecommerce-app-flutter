import 'package:ecommerce_app/domain/entities/category_entity.dart';

class Category {
  final int  id;
  final String name;
  final String slug;
  final String image;

  Category({
    required this.id,
    required this.name,
    required this.slug,
    required this.image,
  });

  factory Category.fromJson(Map<String, dynamic> json) {
    return Category(
      id: json['id'],
      name: json['name'],
      slug: json['slug'],
      image: json['image'],
    );
  }


  CategoryEntity toEntity() => CategoryEntity(
        id: id,
        name: name,
        slug: slug,
        image: image,
      );
}
