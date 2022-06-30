import 'dart:convert';
import 'package:comicreadingapp/view/dashboard/dashboard_screen.dart';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;

import '../../service/remote_service/comment_service.dart';
class SendComment extends StatefulWidget {
  const SendComment({Key? key}) : super(key: key);

  @override
  State<SendComment> createState() => _SendCommentState();
}

class _SendCommentState extends State<SendComment> {
  String comment = '';
  int comic_id = 1;
  int user_id = 3;

  addComments() async {
      http.Response response = await CommentServices.addComment(
          comment, comic_id, user_id);
      Map responseMap = jsonDecode(response.body);

      if (response.statusCode == 200) {
        Navigator.push(context, MaterialPageRoute(
            builder: (BuildContext context) => const DashboardScreen()));
      }

  }

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.only(top: 20, left: 20, right: 20),
      height: 150,
      child: TextField(
        onChanged: (value){
          comment = value;
        },
        decoration: InputDecoration(
          focusColor: Colors.green,
          labelText: 'Send your comment',
          isDense: true,
          contentPadding: const EdgeInsets.all(30),
          suffixIcon: IconButton(
              icon: const Icon(Icons.send, color: Colors.green, size: 25),
              onPressed: () => addComments()),
          border: OutlineInputBorder(borderRadius: BorderRadius.circular(15),),
        ),
      ),
    );
  }
}
