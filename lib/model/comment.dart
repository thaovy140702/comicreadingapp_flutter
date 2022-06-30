import 'dart:convert';

List<Comment> commentListFromJson(String val) => List<Comment>.from(
    json.decode(val)['comments'].map((comment) => Comment.fromJson(comment))
);

class Comment {
  final int id;
  final String comment;
  final String name;


  Comment({
    required this.id,
    required this.comment,
    required this.name,


  });

  factory Comment.fromJson(Map<String, dynamic> data) => Comment(
    id: data['id'],
    comment: data['comment'],
    name: data['name'],
  );
}