class ShortsModel {
  final String name;
  final String variation;
  final String imagePath;
  final double price;

  const ShortsModel({
    required this.name,
    required this.variation,
    required this.imagePath,
    required this.price,
  });
}

const List<ShortsModel> shorts = [
  ShortsModel(name: 'JERSEY', variation: 'Select', imagePath: 'assets/images/shorts.jpeg', price: 99.0),
  ShortsModel(name: 'CARGO', variation: 'Select', imagePath: 'assets/images/cargo_shorts.jpeg', price: 99.0),
  ShortsModel(name: 'DENIM', variation: 'Select', imagePath: 'assets/images/denim_shorts.jpeg', price: 99.0),
  ShortsModel(name: 'TAILORED', variation: 'Select', imagePath: 'assets/images/tailored_shorts.jpeg', price: 99.0),
  ShortsModel(name: 'RETRO', variation: 'Select', imagePath: 'assets/images/retro_shorts.jpeg', price: 99.0),
];
