import 'dart:convert';

List<Comic> comicListFromJson(String val) => List<Comic>.from(
    json.decode(val)['comics'].map((comic) => Comic.fromJson(comic))
);

class Comic {
  final int id;
  final String comic_name;
  final String comic_image;
  final String author;
  final String description;
  final int votes;
  final int chapters;
  final int category_id;
  final String created_at;

  Comic({
    required this.id,
    required this.comic_name,
    required this.comic_image,
    required this.author,
    required this.description,
    required this.votes,
    required this.chapters,
    required this.category_id,
    required this.created_at
  });

  factory Comic.fromJson(Map<String, dynamic> data) => Comic(
    id: data['id'],
    comic_name: data['comic_name'],
    comic_image: data['comic_image'],
    author: data['author'],
    description: data['description'],
    votes: data['votes'],
    chapters: data['chapters'],
    category_id: data['category_id'],
    created_at: data['created_at'],
  );
}