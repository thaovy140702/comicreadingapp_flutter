import 'package:comicreadingapp/component/content_comic/content_list.dart';
import 'package:comicreadingapp/controller/controllers.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import '../../model/chapter.dart';

class ChapterLoading extends StatelessWidget {
  final Chapter chapter;

  const ChapterLoading({Key? key, required this.chapter}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
        padding: const EdgeInsets.only(bottom: 10),
        child: InkWell(
          splashColor: Colors.black26,
          onTap: () {
            Navigator.of(context).push(MaterialPageRoute(
                builder: (context) =>
                    ContentList(contents: homeController.contentList)));
          },
          child: Ink(
            child: Text(
                chapter.chapter_name,
                style: GoogleFonts.nunitoSans(
                    fontStyle: FontStyle.normal,
                    fontSize: 18,
                    color: Colors.orange)
            ),
          ),
        )
    );
  }
}
