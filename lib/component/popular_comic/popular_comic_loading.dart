import 'package:comicreadingapp/component/popular_comic/popular_comic_loading_card.dart';
import 'package:flutter/material.dart';

class PopularComicLoading extends StatelessWidget {
  const PopularComicLoading({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 220,
      padding: const EdgeInsets.only(right:10),
      child: ListView.builder(
          scrollDirection: Axis.horizontal,
          physics: const BouncingScrollPhysics(),
          itemCount: 7,
          itemBuilder: (context,index) => const PopularComicLoadingCard()),
    );
  }
}
