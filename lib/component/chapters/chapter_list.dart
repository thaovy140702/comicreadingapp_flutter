import 'package:comicreadingapp/component/chapters/chapters_loading.dart';
import 'package:flutter/material.dart';
import '../../model/chapter.dart';

class ChapterList extends StatelessWidget {
  final List<Chapter> chapterList;
  const ChapterList({Key? key, required this.chapterList}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 450,
      padding: const EdgeInsets.only(right:10),
        child: ListView.builder(
            itemCount: chapterList.length,
            itemBuilder: (context,index) => ChapterLoading(
              chapter: chapterList[index],
                )
        )
    );
  }
}
