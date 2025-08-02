class ProductEntity {
  final int ?id;
  final String title;
  final String description;
  final double price;
  final int categoryId;
  final List<String> images;

  ProductEntity({
    required this.id,
    required this.title,
    required this.description,
    required this.price,
    required this.categoryId,
    required this.images,
  });
}
