import 'package:comicreadingapp/component/popular_comic/popular_comic_card.dart';
import 'package:flutter/material.dart';
import '../../model/comic.dart';

class PopularComic extends StatelessWidget {
  final List<Comic> comicList;
  const PopularComic({Key? key, required this.comicList}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 220,
      padding: const EdgeInsets.only(right:10),
      child: ListView.builder(
          scrollDirection: Axis.horizontal,
          physics: const BouncingScrollPhysics(),
          itemCount: comicList.length,
          itemBuilder: (context,index) => PopularComicCard(
              comic: comicList[index])
      ),
    );
  }
}
