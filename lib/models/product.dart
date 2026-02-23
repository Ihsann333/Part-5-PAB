class Product {
  final String id;
  final String name;
  final double price;
  final String emoji;

  Product({
    required this.id,
    required this.name,
    required this.price,
    required this.emoji,
  });
}

final List<Product> products = [
  Product(id: '1', name: 'Apple', price: 10000, emoji: '🍎'),
  Product(id: '2', name: 'Banana', price: 8000, emoji: '🍌'),
  Product(id: '3', name: 'Orange', price: 12000, emoji: '🍊'),
  Product(id: '4', name: 'Mango', price: 15000, emoji: '🥭'),
];