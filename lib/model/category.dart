import 'dart:convert';

List<Category> categoryListFromJson(String val) => List<Category>.from(
    json.decode(val)['categories'].map((category) => Category.fromJson(category))
);

class Category {
  final int id;
  final String category_name;
  final String category_image;

  Category({
    required this.id,
    required this.category_name,
    required this.category_image
  });

  factory Category.fromJson(Map<String, dynamic> data) => Category(
    id: data['id'],
    category_name: data['category_name'],
      category_image: data['category_image']
  );
}