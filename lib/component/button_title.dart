import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';

import '../view/home/my_page.dart';
class ButtonTitle extends StatelessWidget {
  final String title;
  const ButtonTitle({Key? key, required this.title}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.fromLTRB(20, 10,30, 5),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Text(
            title,
            style: const TextStyle(
                fontSize: 18,
                fontFamily: 'Open Sans',
                fontWeight: FontWeight.bold,
                color: Colors.black
            ),
          ),
          MaterialButton(
              height: 40,
              color: Colors.green,
              child: const Text('Log Out'),
              onPressed: () async {
                final SharedPreferences sharedPreferences = await SharedPreferences.getInstance();
                sharedPreferences.remove('email');
                Navigator.push(context, MaterialPageRoute(
                    builder: (BuildContext context) => const MyPage()));
              })
        ],
      ),
    );
  }
}
