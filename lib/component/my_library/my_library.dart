import 'package:comicreadingapp/component/my_library/library_card.dart';
import 'package:flutter/material.dart';
import '../../model/library.dart';
import '../button_title.dart';

class MyLibrary extends StatelessWidget {
  final List<Library> library;
  const MyLibrary({Key? key, required this.library}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 250,
      padding: const EdgeInsets.only(right:10),
      child:
      ListView.builder(
          scrollDirection: Axis.horizontal,
          physics: const BouncingScrollPhysics(),
          itemCount: library.length,
          itemBuilder: (context,index) => LibraryCard(library: library[index])
      ),
    );
  }
}
