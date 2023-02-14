class Product {
  final String label;
  final String description;
  final double price;
  final String priceBaseType;
  final double weight;
  final double length;
  final double width;
  final double height;

  Product({
    required this.label,
    required this.description,
    required this.price,
    required this.priceBaseType,
    required this.weight,
    required this.length,
    required this.width,
    required this.height,
  });

  factory Product.fromJson(Map<String, dynamic> json) {
    return Product(
      label: json['label'],
      description: json['description'],
      price: double.parse(json['price']),
      priceBaseType: json['price_base_type'],
      weight: double.parse(json['weight']),
      length: double.parse(json['length']),
      width: double.parse(json['width']),
      height: double.parse(json['height']),
    );
  }
}
