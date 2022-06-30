import 'package:comicreadingapp/component/comment_show/comment_loading.dart';
import 'package:flutter/material.dart';
import '../../model/comment.dart';
class CommentList extends StatelessWidget {
  final List<Comment> comments;
  const CommentList({Key? key, required this.comments}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 250,
      padding: const EdgeInsets.only(right:10),
      child: ListView.builder(
          scrollDirection: Axis.vertical,
          physics: const BouncingScrollPhysics(),
          itemCount: comments.length,
          itemBuilder: (context,index) => CommentLoading(comment: comments[index])
      ),
    );
  }
}
