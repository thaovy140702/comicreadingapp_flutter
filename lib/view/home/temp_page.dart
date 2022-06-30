import 'dart:async';

import 'package:comicreadingapp/view/home/welcome_page.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get/get_core/src/get_main.dart';
import 'empty_page.dart';
import 'my_page.dart';

class TempPage extends StatefulWidget {
  const TempPage({Key? key}) : super(key: key);

  @override
  State<TempPage> createState() => _TempPageState();
}

class _TempPageState extends State<TempPage> {

  void initState(){
    Timer(const Duration(seconds: 2), () => Get.to(
        finalEmail.isNotEmpty ? () => const MyPage() : () => const EmptyPage()
    ));

  }

  @override
  Widget build(BuildContext context) {
    return Container();
  }
}
