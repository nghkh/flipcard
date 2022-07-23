import 'package:flutter/material.dart';
import 'data.dart';
bool isBack = true;
Widget buildFlipCard(BuildContext context, int index) {

  return Container(
    alignment: Alignment.center,
    decoration: BoxDecoration(
      borderRadius: BorderRadius.circular(16),
      color: Colors.blue,
    ),
    child: isBack
        ? Text(
            '?',
            style: TextStyle(
              fontSize: 30,
              fontWeight: FontWeight.bold,
            ),
          )
        : Image.asset(levelAndKindList[index]),
  );
}
