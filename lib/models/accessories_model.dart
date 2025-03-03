class AccessoriesModel {
  final String name;
  final String variation;
  final String imagePath;
  final double price;

  const AccessoriesModel({
    required this.name,
    required this.variation,
    required this.imagePath,
    required this.price,
  });
}

const List<AccessoriesModel> accessories = [
  AccessoriesModel(name: 'BASKETBALL SOCKS', variation: 'Select', imagePath: 'assets/images/Basketball_accessories.jpeg', price: 99.0),
  AccessoriesModel(name: 'HEADBANDS', variation: 'Select', imagePath: 'assets/images/headbands_accessories.jpeg', price: 99.0),
  AccessoriesModel(name: 'BACKPACK', variation: 'Select', imagePath: 'assets/images/bag.jpeg', price: 99.0),
  AccessoriesModel(name: 'SLEEVES', variation: 'Select', imagePath: 'assets/images/sleeves_accessories.jpeg', price: 99.0),
  AccessoriesModel(name: 'CAP', variation: 'Select', imagePath: 'assets/images/cap_accessories.jpeg', price: 99.0),
];
