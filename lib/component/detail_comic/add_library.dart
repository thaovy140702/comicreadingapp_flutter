import 'dart:convert';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import '../../service/remote_service/mylibrary_service.dart';
import '../../view/home/my_page.dart';
import '../../view/widgets/app_text.dart';

class AddLibrary extends StatefulWidget {
  const AddLibrary({Key? key}) : super(key: key);

  @override
  State<AddLibrary> createState() => _AddLibraryState();
}

class _AddLibraryState extends State<AddLibrary> {
  int comic_id = 1;
  int user_id = 3;

  addComics() async {
    http.Response response = await LibraryServices.addComics(
        comic_id, user_id);
    Map responseMap = jsonDecode(response.body);

    if (response.statusCode == 200) {
      Navigator.push(context, MaterialPageRoute(
          builder: (BuildContext context) => const MyPage()));
    }

  }

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.only(left: 100, right: 100, bottom: 25),
      height: 49,
      color: Colors.green,
      child: TextButton(
          style: TextButton.styleFrom(
              textStyle: const TextStyle(fontSize: 20),
              primary: Colors.orange,
              shape: const RoundedRectangleBorder(
                  borderRadius: BorderRadius.all(Radius.circular(10)))
          ),
          onPressed: () => addComics(),
          child: AppText(text: "Add to my Library",size: 16, color: Colors.white,)
      ),
    );
  }
}
