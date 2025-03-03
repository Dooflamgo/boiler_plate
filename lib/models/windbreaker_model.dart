class WindbreakerModel {
  final String name;
  final String variation;
  final String imagePath;
  final double price;

  const WindbreakerModel({
    required this.name,
    required this.variation,
    required this.imagePath,
    required this.price,
  });
}

const List<WindbreakerModel> windbreakers = [
  WindbreakerModel(name: 'AESTHETIC', variation: 'Select', imagePath: 'assets/images/techware_windbreaker.jpeg', price: 99.0),
  WindbreakerModel(name: 'MODERN', variation: 'Select', imagePath: 'assets/images/modern_windbreaker.jpeg', price: 99.0),
  WindbreakerModel(name: 'CLASSIC', variation: 'Select', imagePath: 'assets/images/classic_windbreaker.jpeg', price: 99.0),
  WindbreakerModel(name: 'RACING', variation: 'Select', imagePath: 'assets/images/racing_windbreaker.jpeg', price: 99.0),
  WindbreakerModel(name: 'LIFESTYLE', variation: 'Select', imagePath: 'assets/images/windbreaker.jpeg', price: 99.0),
];
