import 'dart:convert';
import 'package:comicreadingapp/const.dart';
import 'package:http/http.dart' as http;
import 'globals.dart';

class LibraryServices {
  static Future<http.Response> addComics(
      int comic_id, int user_id) async {
    Map data = {
      "comic_id": comic_id,
      "user_id": user_id,
    };
    var body = json.encode(data);
    var url = Uri.parse('$baseUrl/api/addcomic');
    http.Response response = await http.post(
        url,
        headers: headers,
        body: body
    );
    print(response.body);
    return response;
  }
}