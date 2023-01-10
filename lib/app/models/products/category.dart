import 'dart:convert';

class Category {
  Category({
    required this.title,
    required this.slug,
    this.description,
    this.image,
  });

  final String title;
  final String slug;
  final String? description;
  final String? image;

  static List<Category> categoryFromJson(String str) => List<Category>.from(
        json.decode(str)!.map(
              (x) => Category.fromJson(x),
            ),
      );

  static String categoryToJson(List<Category> data) => json.encode(
        List<dynamic>.from(
          data.map(
            (x) => x.toJson(),
          ),
        ),
      );

  factory Category.fromJson(Map<String, dynamic> json) => Category(
        title: json["title"],
        slug: json["slug"],
        description: json["description"],
        image: json["image"],
      );

  Map<String, dynamic> toJson() => {
        "title": title,
        "slug": slug,
        "description": description,
        "image": image,
      };
}
