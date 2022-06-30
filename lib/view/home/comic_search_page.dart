import 'dart:async';
import 'package:comicreadingapp/component/main_header.dart';
import 'package:comicreadingapp/view/widgets/app_large_text.dart';
import 'package:flutter/material.dart';
import '../../component/comic_search/comic_model.dart';
import '../../component/comic_search/comics_api.dart';
import '../../component/comic_search/search_widget.dart';
import '../widgets/app_text.dart';

class ComicSearchPage extends StatefulWidget {
  @override
  ComicSearchPageState createState() => ComicSearchPageState();
}

class ComicSearchPageState extends State<ComicSearchPage> {
  List<ComicSearch> comics = [];
  String query = '';
  Timer? debouncer;

  @override
  void initState() {
    super.initState();

    init();
  }

  @override
  void dispose() {
    debouncer?.cancel();
    super.dispose();
  }

  void debounce(
      VoidCallback callback, {
        Duration duration = const Duration(milliseconds: 1000),
      }) {
    if (debouncer != null) {
      debouncer!.cancel();
    }

    debouncer = Timer(duration, callback);
  }

  Future init() async {
    final comics = await ComicsApi.getComics(query);

    setState(() => this.comics = comics);
  }

  @override
  Widget build(BuildContext context) => Scaffold(
    body: Column(
      children: <Widget>[
        const SizedBox(height: 30),
        const MainHeader(),
        buildSearch(),
        Expanded(
          child: ListView.builder(
            itemCount: comics.length,
            itemBuilder: (context, index) {
              final comic = comics[index];
              return buildBook(comic);
            },
          ),
        ),
      ],
    ),
  );

  Widget buildSearch() => SearchWidget(
    text: query,
    hintText: 'Search Comic Name or Author Name',
    onChanged: searchBook,
  );

  Future searchBook(String query) async => debounce(() async {
    final comics = await ComicsApi.getComics(query);

    if (!mounted) return;

    setState(() {
      this.query = query;
      this.comics = comics;
    });
  });

  Widget buildBook(ComicSearch comic) => ListTile(
    leading: Image.network(
      comic.comic_image,
      fit: BoxFit.cover,
      width: 50,
      height: 50,
    ),
    title: AppLargeText(text: comic.comic_name,size: 18),
    subtitle: AppText(text: comic.author, size: 16,),
  );
}
