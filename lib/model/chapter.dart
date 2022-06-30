import 'dart:convert';

List<Chapter> chapterListFromJson(String val) => List<Chapter>.from(
    json.decode(val)['chapters'].map((chapter) => Chapter.fromJson(chapter))
);

class Chapter {
  final int id;
  final String chapter_name;
  final int comic_id;

  Chapter({
    required this.id,
    required this.chapter_name,
    required this.comic_id
  });

  factory Chapter.fromJson(Map<String, dynamic> data) => Chapter(
    id: data['id'],
    chapter_name: data['chapter_name'],
    comic_id: data['comic_id'],

  );
}