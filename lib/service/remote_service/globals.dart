
import 'package:flutter/material.dart';

const Map<String, String> headers = {"Content_Type": "application/json"};

errorSnackBar(BuildContext context, String text)
{
  ScaffoldMessenger.of(context).showSnackBar(SnackBar(
    backgroundColor: Colors.red,
    content: Text(text),
    duration: const Duration(seconds: 1),
  ));
}
