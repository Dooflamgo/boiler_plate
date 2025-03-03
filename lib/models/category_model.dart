class Category {
  final String name;
  final String imagePath;
  final String route;

  Category({required this.name, required this.imagePath, required this.route});
}

final List<Category> categories = [
  Category(name: 'Hoodies', imagePath: 'assets/images/jjk_hoodie.jpeg', route: '/hoodies'),
  Category(name: 'Windbreakers', imagePath: 'assets/images/windbreaker.jpeg', route: '/windbreakers'),
  Category(name: 'Shorts', imagePath: 'assets/images/shorts.jpeg', route: '/shorts'),
  Category(name: 'Jacket', imagePath: 'assets/images/jacket.jpeg', route: '/jackets'),
  Category(name: 'Shoes', imagePath: 'assets/images/Shoes.jpeg', route: '/shoes'),
  Category(name: 'Accessories', imagePath: 'assets/images/bag.jpeg', route: '/accessories'),
];
