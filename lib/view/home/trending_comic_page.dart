import 'package:comicreadingapp/component/trending_comic/trending_comic_loading.dart';
import 'package:comicreadingapp/view/widgets/app_large_text.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import '../../component/main_header.dart';
import '../../model/comic.dart';

class TrendingComicPage extends StatelessWidget {
  final List<Comic> comics;
  const TrendingComicPage({Key? key, required this.comics}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        children: <Widget>[
          const SizedBox(height: 30),
          const MainHeader(),
          const SizedBox(height: 30),
          Padding(
            padding: const EdgeInsets.only(left: 20),
            child: AppLargeText(text: 'Comic Rankings', size: 24),
          ),
          const SizedBox(height: 30),

          Expanded(
            child: ListView.builder(
              itemCount: comics.length,
                itemBuilder: (context,index) => TrendingComicLoading(comic: comics[index])
            ),
          ),
        ],
      ),
    );
  }
}
