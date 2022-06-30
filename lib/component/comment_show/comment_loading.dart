import 'package:flutter/material.dart';
import '../../model/comment.dart';

class CommentLoading extends StatelessWidget {
  final Comment comment;
  const CommentLoading({Key? key, required this.comment}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ListTile(
      leading: Image.network(
        'https://cdn-icons-png.flaticon.com/128/1946/1946429.png',
        fit: BoxFit.cover,
        width: 30,
        height: 30,
      ),
      title: Text(comment.name, style: const TextStyle(fontSize: 18, fontWeight: FontWeight.bold),),
      subtitle: Text(comment.comment, style: const TextStyle(fontSize: 16, color: Colors.black87)),
    );
  }
}
