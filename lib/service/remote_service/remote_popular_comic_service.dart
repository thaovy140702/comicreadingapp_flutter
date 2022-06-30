import 'package:http/http.dart' as http;
import '../../const.dart';


class RemotePopularComicService {
  var client = http.Client();
  var remoteUrl = '$baseUrl/api/comics';

  Future<dynamic> get() async {
    var response = await client.get(Uri.parse(remoteUrl));
    return response;
  }
}