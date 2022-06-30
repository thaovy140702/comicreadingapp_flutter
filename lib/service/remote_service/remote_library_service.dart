import 'package:http/http.dart' as http;
import '../../const.dart';


class RemoteLibraryService {
  var client = http.Client();
  var remoteUrl = '$baseUrl/api/mylibrary';

  Future<dynamic> get() async {
    var response = await client.get(Uri.parse(remoteUrl));
    return response;
  }
}