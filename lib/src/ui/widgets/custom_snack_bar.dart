import 'dart:convert';

import 'package:flutter/material.dart';

class CustomSnackBar {
  static void show(BuildContext context, String message,
      {bool success = true}) {
    String decodedMessage = message;

    try {
      decodedMessage = utf8.decode(message.runes.toList());
    } catch (e) {
      print("Aviso: A sequência de bytes não está codificada em UTF-8");
    }

    ScaffoldMessenger.of(context).showSnackBar(
      SnackBar(
        content: Text(decodedMessage),
        backgroundColor: success ? Colors.green : Colors.red,
      ),
    );
  }
}
