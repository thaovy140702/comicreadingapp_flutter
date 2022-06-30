import 'package:flutter/material.dart';
import '../../model/library.dart';

class BuildContent extends StatelessWidget {
  final Library library;
  const BuildContent({Key? key, required this.library}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        const SizedBox(height: 8),
        Text(
          library.name,
          style: const TextStyle(fontSize: 28, fontWeight: FontWeight.bold),
        ),
        const SizedBox(height: 8),
        Text(
          library.email,
          style: const TextStyle(fontSize: 20, color: Colors.black87),
        ),
      ],
    );
  }
}
