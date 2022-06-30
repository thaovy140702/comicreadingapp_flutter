import 'package:comicreadingapp/component/content_comic/content_loading.dart';
import 'package:flutter/material.dart';
import '../../model/content.dart';

class ContentList extends StatelessWidget {
  final List<Content> contents;
  const ContentList({Key? key, required this.contents}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ListView.builder(
        scrollDirection: Axis.vertical,
        physics: const BouncingScrollPhysics(),
        itemCount: contents.length,
        itemBuilder: (context,index) => ContentLoading(
            content: contents[index]
        ));
  }
}
