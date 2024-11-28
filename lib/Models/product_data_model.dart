class ProductModel {
  final int id;
  final String title;
  final double price;
  final String description;
  final String image;

  ProductModel({
    required this.id,
    required this.title,
    required this.price,
    required this.description,
    required this.image,
  });

  factory ProductModel.fromJson(Map<String, dynamic> json) {
    String imageUrl = '';
    if (json['images'] is List && json['images'].isNotEmpty) {
      var firstEntry = json['images'][0];
      if (firstEntry is String) {
        imageUrl = firstEntry
            .replaceAll('[', '')
            .replaceAll(']', '')
            .replaceAll('"', '')
            .trim();
      }
    }

    return ProductModel(
      id: json['id'],
      title: json['title'],
      price: (json['price'] as num).toDouble(),
      description: json['description'] ?? '',
      image: imageUrl,
    );
  }
}
