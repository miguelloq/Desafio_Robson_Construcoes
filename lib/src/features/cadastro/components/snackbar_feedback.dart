import 'package:flutter/material.dart';

showSnackbarFeedback(
    {required BuildContext context,
    required String mensagem,
    required bool isError}) {
  ScaffoldMessenger.of(context).showSnackBar(
    SnackBar(
      content: Text(
        mensagem,
        style: const TextStyle(color: Colors.white),
      ),
      backgroundColor: isError ? Colors.red : Colors.green,
    ),
  );
}
