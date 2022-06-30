import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';

class MainHeader extends StatelessWidget {
  const MainHeader({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(10),
      child: Row(
        children: [
          Text(
            'Comic Reading App',
            style: GoogleFonts.fredokaOne(
                fontStyle: FontStyle.normal,
                fontSize: 25,
                color: Colors.black),
          ),
          Expanded(child: Container()),
          Container(
            margin: const EdgeInsets.only(right: 20),
            width: 50,
            height: 50,
            decoration: const BoxDecoration(
                image: DecorationImage(
                    image: AssetImage(
                        'img/comic-book.png'
                    )
                )
            ),
          )
        ],
      ),
    );

  }
}
