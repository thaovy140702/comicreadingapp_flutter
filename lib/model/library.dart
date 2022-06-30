import 'dart:convert';

List<Library> libraryListFromJson(String val) => List<Library>.from(
    json.decode(val)['mylibrary'].map((library) => Library.fromJson(library))
);

class Library {
  final int id;
  final String name;
  final String email;
  final String comic_name;
  final String comic_image;


  Library({
    required this.id,
    required this.name,
    required this.email,
    required this.comic_name,
    required this.comic_image
  });

  factory Library.fromJson(Map<String, dynamic> data) => Library(
    id: data['id'],
    name: data['name'],
    email: data['email'],
    comic_name: data['comic_name'],
    comic_image: data['comic_image'],

  );
}