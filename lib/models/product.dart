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

final products = [
  Product(id: "1", name: "Coffee", price: 20000, emoji: "☕"),
  Product(id: "2", name: "Burger", price: 35000, emoji: "🍔"),
  Product(id: "3", name: "Pizza", price: 50000, emoji: "🍕"),
  Product(id: "4", name: "Cake", price: 25000, emoji: "🍰"),
];