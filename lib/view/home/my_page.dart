import 'dart:async';

import 'package:comicreadingapp/component/button_title.dart';
import 'package:comicreadingapp/component/my_library/my_library.dart';
import 'package:comicreadingapp/controller/controllers.dart';
import 'package:comicreadingapp/view/home/welcome_page.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get/get_core/src/get_main.dart';

import '../../model/library.dart';
class MyPage extends StatefulWidget {
  const MyPage({Key? key}) : super(key: key);

  @override
  State<MyPage> createState() => _MyPageState();
}

class _MyPageState extends State<MyPage> {
  late final Library library;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: ListView(
        padding: EdgeInsets.zero,
        children: <Widget> [
          buildTop(),
          buildContent(),
          const SizedBox(height: 30),
          const ButtonTitle(title: 'My library'),
          const SizedBox(height: 30),
          MyLibrary(library: homeController.libraryList)
        ],
      )
    );
  }
  Widget buildCoverImage() => Container(
    color: Colors.grey,
    child: Image.network(
      'https://i.pinimg.com/564x/b0/fb/37/b0fb3743976cc37f0aa5ac5babb52988.jpg',
      width: double.infinity,
      height: 280,
      fit: BoxFit.cover,
    ),
  );

  Widget buildProfileImage() => CircleAvatar(
    radius: 72,
    backgroundColor: Colors.grey.shade800,
    backgroundImage: const NetworkImage(
      'https://img.freepik.com/free-vector/female-user-profile-avatar-is-woman-character-screen-saver-with-emotions_505620-617.jpg'
    ),
  );

      Widget buildTop() {
        return Stack(
          clipBehavior: Clip.none,
          alignment: Alignment.center,
          children: [
            Container(
              margin: const EdgeInsets.only(bottom: 70),
                child: buildCoverImage()),
            Positioned(
                top: 210, child:  buildProfileImage())
          ],
        );
      }

      Widget buildContent() => Column(
              children: [
                const SizedBox(height: 8),
                const Text(
                  'Hello',
                  style: TextStyle(fontSize: 28, fontWeight: FontWeight.bold),
                ),
                const SizedBox(height: 8),
                Text(
                  finalEmail,
                  style: const TextStyle(fontSize: 20, color: Colors.black87),
                ),
              ],
      );





}
