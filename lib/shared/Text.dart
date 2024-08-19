import 'package:flutter/material.dart';

Padding TextGray(String content) {
  return Padding(
    padding: const EdgeInsets.symmetric(vertical: 3),
    child: Text(
      content,
      style: const TextStyle(
          fontWeight: FontWeight.bold, fontSize: 16, color: Colors.grey),
    ),
  );
}

Padding TextSection(String content) {
  return Padding(
    padding: const EdgeInsets.symmetric(vertical: 5),
    child: Text(
      content,
      style: const TextStyle(fontWeight: FontWeight.bold, fontSize: 17),
    ),
  );
}
