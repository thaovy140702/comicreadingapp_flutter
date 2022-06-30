import 'package:flutter/material.dart';
import '../../model/comic.dart';
import '../../view/widgets/app_large_text.dart';
import '../../view/widgets/app_text.dart';

class TrendingComicLoading extends StatelessWidget {
  final Comic comic;
  const TrendingComicLoading({Key? key, required this.comic}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    var votes = comic.votes;
    String t = "$votes";

    return ListTile(
      leading: Image.network(
        comic.comic_image,
        fit: BoxFit.cover,
        width: 50,
        height: 50,
      ),
      title: AppLargeText(text: comic.comic_name,size: 18),
      subtitle: AppText(text: comic.author, size: 16,),
      trailing: Row(
        mainAxisSize: MainAxisSize.min,
        children: [
          AppLargeText(text: t, size: 16),
          const Icon(Icons.favorite, color: Colors.red)
        ],
      )

    );
  }
}
