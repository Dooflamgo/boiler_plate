class Product {
  final int id;
  final String name;
  final String slug;
  final double price;
  final int categoryId;
  final String? imageUrl;
  final String description;
  final int stock;

  Product({
    required this.id,
    required this.name,
    required this.slug,
    required this.price,
    required this.categoryId,
    this.imageUrl,
    required this.description,
    required this.stock,
  });

  /// Factory constructor to create a Product from JSON
  factory Product.fromJson(Map<String, dynamic> json) {
    return Product(
      id: json['id'],
      name: json['name'],
      slug: json['slug'],
      price: double.parse(json['price'].toString()), // Handle double conversion
      categoryId: json['category_id'],
      imageUrl: json['image_url'], // This should match Laravel's `getImageUrlAttribute`
      description: json['description'] ?? '',
      stock: json['stock'],
    );
  }

  /// Convert Product object to JSON (useful for API requests)
  Map<String, dynamic> toJson() {
    return {
      'id': id,
      'name': name,
      'slug': slug,
      'price': price,
      'category_id': categoryId,
      'image_url': imageUrl,
      'description': description,
      'stock': stock,
    };
  }
}
