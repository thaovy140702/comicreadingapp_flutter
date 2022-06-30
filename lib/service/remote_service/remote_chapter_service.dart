import 'package:http/http.dart' as http;
import '../../const.dart';


class RemoteChapterService {
  var client = http.Client();
  var remoteUrl = '$baseUrl/api/chapters';

  Future<dynamic> get() async {
    var response = await client.get(Uri.parse(remoteUrl));
    return response;
  }
}