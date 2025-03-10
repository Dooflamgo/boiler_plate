class Category {
  final int id;
  final String name;
  final String image;

  Category({
    required this.id,
    required this.name,
    required this.image,
  });

  factory Category.fromJson(Map<String, dynamic> json) {
    String fixedImageUrl = (json['image'] ?? "").replaceAll("localhost", "192.168.1.100");

    return Category(
      id: (json['id'] is int) ? json['id'] : int.tryParse(json['id'].toString()) ?? 0,
      name: json['name'] ?? '',
      image: fixedImageUrl,
    );
  }
}
