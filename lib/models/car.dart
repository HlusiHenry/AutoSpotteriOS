class Car {
  final String id;
  final String brand;
  final String model;
  final int year;
  final String category;
  final int rarityLevel; // 1-5
  final int hp;
  final int topSpeed;
  final String price;
  final String description;
  final String emoji;

  const Car({
    required this.id,
    required this.brand,
    required this.model,
    required this.year,
    required this.category,
    required this.rarityLevel,
    required this.hp,
    required this.topSpeed,
    required this.price,
    required this.description,
    required this.emoji,
  });

  int get points {
    switch (rarityLevel) {
      case 1: return 10;
      case 2: return 25;
      case 3: return 50;
      case 4: return 100;
      case 5: return 250;
      default: return 10;
    }
  }

  String get rarityLabel {
    switch (rarityLevel) {
      case 1: return 'Häufig';
      case 2: return 'Gelegentlich';
      case 3: return 'Selten';
      case 4: return 'Sehr selten';
      case 5: return 'Extrem selten';
      default: return 'Unbekannt';
    }
  }
}