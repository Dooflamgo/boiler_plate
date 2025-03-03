class Hoodie {
  final String name;
  final String variation;
  final String imagePath;
  final double price;

  const Hoodie({
    required this.name,
    required this.variation,
    required this.imagePath,
    required this.price,
  });
}

const List<Hoodie> hoodies = [
  Hoodie(name: 'JUJUTSU KAISEN', variation: 'Yuji Itadori', imagePath: 'assets/images/jjk_hoodie.jpeg', price: 99.0),
  Hoodie(name: 'NARUTO SHIPPUDEN', variation: 'Akatsuki', imagePath: 'assets/images/akatsuki_hoodie.jpeg', price: 99.0),
  Hoodie(name: 'ATTACK ON TITAN', variation: 'Scout Regiment', imagePath: 'assets/images/aot_hoodie.jpeg', price: 99.0),
  Hoodie(name: 'DRAGON BALL', variation: 'Goku', imagePath: 'assets/images/dbz_hoodie.jpeg', price: 99.0),
  Hoodie(name: 'TOKYO GHOUL', variation: 'Kaneki Ken', imagePath: 'assets/images/kaneki_hoodie.jpeg', price: 99.0),
];
