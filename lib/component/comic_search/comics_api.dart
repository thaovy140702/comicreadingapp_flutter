import 'dart:convert';
import 'package:comicreadingapp/component/comic_search/comic_model.dart';
import 'package:comicreadingapp/const.dart';
import 'package:http/http.dart' as http;

class ComicsApi {
  static Future<List<ComicSearch>> getComics(String query) async {
    final url = Uri.parse(
        '$baseUrl/api/comicstest');
    final response = await http.get(url);

    if (response.statusCode == 200) {
      final List comics = json.decode(response.body);

      return comics.map((json) => ComicSearch.fromJson(json)).where((comic) {
        final comicNameLower = comic.comic_name.toLowerCase();
        final authorLower = comic.author.toLowerCase();
        final searchLower = query.toLowerCase();

        return comicNameLower.contains(searchLower) ||
            authorLower.contains(searchLower);
      }).toList();
    } else {
      throw Exception();
    }
  }
}
