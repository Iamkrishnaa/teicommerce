import 'dart:convert';

import 'category.dart';

class Product {
  Product({
    required this.id,
    required this.title,
    required this.description,
    required this.price,
    required this.quantity,
    required this.category,
    required this.averageRating,
    required this.totalRatings,
    required this.createdAt,
    required this.updatedAt,
    required this.productImages,
  });

  final int id;
  final String title;
  final String? description;
  final double price;
  final int quantity;
  final Category category;
  final double averageRating;
  final int totalRatings;
  final DateTime createdAt;
  final DateTime updatedAt;
  final List<ProductImage> productImages;

  static List<Product> productFromJson(String str) => List<Product>.from(
        json.decode(str)!.map(
              (x) => Product.fromJson(x),
            ),
      );

  static String productToJson(List<Product> data) => json.encode(
        List<dynamic>.from(
          data.map(
            (x) => x.toJson(),
          ),
        ),
      );

  factory Product.fromJson(Map<String, dynamic> json) => Product(
        id: json["id"],
        title: json["title"],
        description: json["description"],
        price: json["price"].toDouble(),
        quantity: json["quantity"],
        category: Category.fromJson(json["category"]),
        averageRating: json["averageRating"].toDouble(),
        totalRatings: json["totalRatings"],
        createdAt: DateTime.parse(json["createdAt"]),
        updatedAt: DateTime.parse(json["updatedAt"]),
        productImages: List<ProductImage>.from(
          json["productImages"]!.map(
            (x) => ProductImage.fromJson(x),
          ),
        ),
      );

  Map<String, dynamic> toJson() => {
        "id": id,
        "title": title,
        "description": description,
        "price": price,
        "quantity": quantity,
        "category": category.toJson(),
        "averageRating": averageRating,
        "totalRatings": totalRatings,
        "createdAt": createdAt.toIso8601String(),
        "updatedAt": updatedAt.toIso8601String(),
        "productImages": List<dynamic>.from(
          productImages.map(
            (x) => x.toJson(),
          ),
        ),
      };
}

class ProductImage {
  ProductImage({
    required this.id,
    required this.image,
  });

  final int id;
  final String image;

  factory ProductImage.fromJson(Map<String, dynamic> json) => ProductImage(
        id: json["id"],
        image: json["image"],
      );

  Map<String, dynamic> toJson() => {
        "id": id,
        "image": image,
      };
}
