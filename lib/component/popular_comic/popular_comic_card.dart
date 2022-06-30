import 'package:cached_network_image/cached_network_image.dart';
import 'package:comicreadingapp/component/detail_comic/detail_comic_card.dart';
import 'package:flutter/material.dart';
import 'package:shimmer/shimmer.dart';
import '../../model/comic.dart';

class PopularComicCard extends StatelessWidget {
  final Comic comic;
  const PopularComicCard({Key? key,required this.comic}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.fromLTRB(10, 10, 5, 10),
      child: Material(
        elevation: 8,
        shadowColor: Colors.grey.shade300,
        borderRadius: BorderRadius.circular(10),
        child: Container(
          margin: const EdgeInsets.all(10),
          width: 120,
          child: Column(
            children: [
              AspectRatio(
                aspectRatio: 0.9,
                child: InkWell(
                  splashColor: Colors.black26,
                  onTap: (){
                   Navigator.of(context).push(MaterialPageRoute(
                       builder: (context)=> DetailComicCard(comic: comic)));
                  },
                    child: Ink(
                      child: CachedNetworkImage(
                        imageUrl: comic.comic_image,
                        placeholder: (context, url) => Shimmer.fromColors(
                            baseColor: Colors.grey.shade300,
                            highlightColor: Colors.white,
                            child: Container(
                                color: Colors.grey,
                                padding: const EdgeInsets.all(15),
                                margin: const EdgeInsets.symmetric(
                                    horizontal: 25
                                )
                            ) ),
                        errorWidget: (context, url, error) => const Center(
                          child: Icon(
                            Icons.error_outline,
                            color: Colors.grey,
                          ),
                        ),
                      ),
                    )
                ),
              ),
              const SizedBox(height: 10),
              Padding(
                padding: const EdgeInsets.only(left: 10,bottom: 10),
                child: Text(
                  comic.comic_name,
                  style: const TextStyle(
                    color: Colors.black,
                    fontSize: 14
                  ),
                ),
              )
            ],
          ),
        ),
      ),
    );
  }
}
