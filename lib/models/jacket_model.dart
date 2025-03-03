class JacketModel {
  final String name;
  final String variation;
  final String imagePath;
  final double price;

  const JacketModel({
    required this.name,
    required this.variation,
    required this.imagePath,
    required this.price,
  });
}

const List<JacketModel> jackets = [
  JacketModel(name: 'TECHWARE', variation: 'Select', imagePath: 'assets/images/jacket.jpeg', price: 99.0),
  JacketModel(name: 'OVERSIZED BOMBER', variation: 'Select', imagePath: 'assets/images/oversized_jacket.jpeg', price: 99.0),
  JacketModel(name: 'PUFFER TEXTURED', variation: 'Select', imagePath: 'assets/images/puffer_jacket.jpeg', price: 99.0),
  JacketModel(name: 'DENIM', variation: 'Select', imagePath: 'assets/images/denim_jacket.jpeg', price: 99.0),
  JacketModel(name: 'HYBRID UTILITY', variation: 'Select', imagePath: 'assets/images/hybrid_jacket.jpeg', price: 99.0),
];
