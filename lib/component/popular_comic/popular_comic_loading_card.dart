import 'package:flutter/material.dart';
import 'package:shimmer/shimmer.dart';

class PopularComicLoadingCard extends StatelessWidget {
  const PopularComicLoadingCard({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.fromLTRB(10, 10, 5, 10),
      child: Material(
        elevation: 8,
        shadowColor: Colors.grey.shade300,
        borderRadius: BorderRadius.circular(10),
        child: Shimmer.fromColors(
            baseColor: Colors.grey.shade300,
            highlightColor: Colors.white,
            child: Container(
              margin: const EdgeInsets.all(10),
              width: 120,
              child: Column(
                children: [
                  AspectRatio(aspectRatio: 0.9,
                  child: Container(
                    color: Colors.grey,
                    padding: const EdgeInsets.all(15),
                    margin: const EdgeInsets.symmetric(
                      horizontal: 25
                    )
                  ),),
                  const SizedBox(height: 10),
                  Padding(
                    padding: const EdgeInsets.only(left: 10, bottom: 10),
                    child: Container(
                      height: 15,
                      color: Colors.grey,
                    ),
                  )
                ],
              ),
            ) ),
      ),
    );
  }
}
