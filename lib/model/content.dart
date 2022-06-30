import 'dart:convert';

List<Content> contentListFromJson(String val) => List<Content>.from(
    json.decode(val)['contents'].map((content) => Content.fromJson(content))
);

class Content {
  final int id;
  final String content;

  Content({
    required this.id,
    required this.content
  });

  factory Content.fromJson(Map<String, dynamic> data) => Content(
    id: data['id'],
    content: data['content'],

  );
}