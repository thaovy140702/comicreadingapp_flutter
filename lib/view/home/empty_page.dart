import 'package:flutter/material.dart';

import 'login_page.dart';


class EmptyPage extends StatelessWidget {
  const EmptyPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.only(left: 30),
        child: GestureDetector(
          onTap: () {
            Navigator.push(context, MaterialPageRoute(
              builder: (BuildContext context) => const LoginPage(),));
          },
          child:
          const Text(
            'You are not logged in. Log in now',
            style: TextStyle(
                decoration: TextDecoration.underline
            ),
          ),
        )
    );
  }
}
