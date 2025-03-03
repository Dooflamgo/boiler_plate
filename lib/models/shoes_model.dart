class ShoesModel {
  final String name;
  final String variation;
  final String imagePath;
  final double price;

  const ShoesModel({
    required this.name,
    required this.variation,
    required this.imagePath,
    required this.price,
  });
}

const List<ShoesModel> shoes = [
  ShoesModel(name: 'JORDAN 1', variation: 'Select', imagePath: 'assets/images/jordan1_shoes.jpeg', price: 99.0),
  ShoesModel(name: 'JORDAN 4', variation: 'Select', imagePath: 'assets/images/jordan4_shoes.jpeg', price: 99.0),
  ShoesModel(name: 'TRAVIS SCOTT', variation: 'Select', imagePath: 'assets/images/Shoes.jpeg', price: 99.0),
  ShoesModel(name: 'KOBE 6', variation: 'Select', imagePath: 'assets/images/kobe6_shoes.jpeg', price: 99.0),
  ShoesModel(name: 'NEW BALANCE', variation: 'Select', imagePath: 'assets/images/nb_shoes.jpeg', price: 99.0),
];
