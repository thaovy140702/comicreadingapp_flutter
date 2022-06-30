import 'package:comicreadingapp/component/chapters/chapter_list.dart';
import 'package:comicreadingapp/component/comment_show/comment_list.dart';
import 'package:comicreadingapp/component/detail_comic/add_library.dart';
import 'package:comicreadingapp/component/detail_comic/send_comment.dart';
import 'package:comicreadingapp/controller/controllers.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import '../../model/comic.dart';
import '../../view/widgets/app_large_text.dart';
import '../../view/widgets/app_text.dart';

class DetailComicCard extends StatelessWidget {
  final Comic comic;
  const DetailComicCard({Key? key, required this.comic}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        bottomNavigationBar: const AddLibrary(),
        body: SafeArea(
          child: CustomScrollView(
            slivers: <Widget>[
              SliverAppBar(
                backgroundColor: Colors.blueGrey,
                expandedHeight: MediaQuery.of(context).size.height * 0.5,
                flexibleSpace: SizedBox(
                  height: MediaQuery.of(context).size.height,
                  child: Stack(
                    children: <Widget>[
                      Align(
                        alignment: Alignment.bottomCenter,
                        child: Container(
                          margin: const EdgeInsets.only(bottom: 40),
                          width: 350,
                          height: 300,
                          decoration: BoxDecoration(
                            image: DecorationImage(
                                image: NetworkImage(
                                  comic.comic_image
                                )
                            ),
                            borderRadius: BorderRadius.circular(10),
                          ),
                        ),
                      )
                    ],
                  ),
                ),
              ),
              SliverList(delegate: SliverChildListDelegate(
                  [
                    Padding(
                      padding: const EdgeInsets.only(top: 24, left: 25),
                      child: AppLargeText(text: comic.comic_name,size: 30),
                    ),
                    Padding(
                      padding: const EdgeInsets.only(top: 24, left: 25),
                      child:
                      AppText(text: comic.author,size: 25
                      ),
                    ),
                    Padding(
                      padding: const EdgeInsets.only(top: 24, left: 25),
                      child: AppLargeText(text: 'Description',size: 20),
                    ),

                    Padding(
                      padding: const EdgeInsets.only(left: 25, right: 25, top: 20, bottom: 25),
                      child: Text(
                          comic.description,
                          style: GoogleFonts.nunitoSans(
                              fontStyle: FontStyle.normal,
                              fontSize: 18,
                              color: Colors.black)
                      ),
                    ),
                    Padding(
                      padding: const EdgeInsets.only(top: 10, left: 25),
                      child: AppLargeText(text: 'Chapters',size: 20),
                    ),
                    Padding(
                      padding: const EdgeInsets.only(top: 10, left: 25),
                      child: ChapterList(chapterList: homeController.chapterList),
                    ),
                    Padding(
                      padding: const EdgeInsets.only(top: 10, left: 25),
                      child: AppLargeText(text: 'All comments',size: 20),
                    ),
                    Padding(
                      padding: const EdgeInsets.only(top: 10, left: 25),
                      child: CommentList(comments: homeController.commentList),
                    ),

                    const Padding(
                      padding: EdgeInsets.only(top: 10, left: 25),
                      child: SendComment(),
                    ),

                  ]
              ))
            ],
          ),
        )
    );
  }
}
