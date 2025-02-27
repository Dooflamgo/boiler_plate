class Category {
  final String name;
  final String imagePath;

  Category({required this.name, required this.imagePath});
}


final List<Category> categories = [
  Category(name: 'Hoodies', imagePath: 'assets/images/'),
  Category(name: 'Windbreakers', imagePath: 'assets/images/'),
  Category(name: 'Shorts', imagePath: 'assets/images/'),
  Category(name: 'Jacket', imagePath: 'assets/images/'),
  Category(name: 'Shoes', imagePath: 'assets/images/'),
  Category(name: 'Accessories', imagePath: 'assets/images/'),
];
