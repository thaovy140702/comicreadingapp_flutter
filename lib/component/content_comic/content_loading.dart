import 'package:flutter/material.dart';
import '../../model/content.dart';

class ContentLoading extends StatelessWidget {
  final Content content;
  const ContentLoading({Key? key, required this.content}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(bottom: 10),
      child: Image.network(
        content.content,
        fit: BoxFit.cover,
        height: 600,
        width: 150,
        alignment: Alignment.center,
      ),
    );
  }
}
