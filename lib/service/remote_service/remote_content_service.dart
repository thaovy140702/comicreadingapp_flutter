import 'package:http/http.dart' as http;

import '../../const.dart';


class RemoteContentService {
  var client = http.Client();
  var remoteUrl = '$baseUrl/api/contents';

  Future<dynamic> get() async {
    var response = await client.get(Uri.parse(remoteUrl));
    return response;
  }
}