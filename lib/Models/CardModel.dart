import 'package:flutter/material.dart';

class CardModel {
  final String title;
  final String value;
  final String iconPath;
  final Widget goToPath;

  CardModel(
      {required this.goToPath,
      required this.title,
      required this.value,
      required this.iconPath});
}
