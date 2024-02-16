import 'package:flutter/material.dart';

class SmallTitle extends StatelessWidget {

  final String text;
  final double width;

  const SmallTitle({super.key, required this.width, required this.text});

  @override
  Widget build(BuildContext context) {
      return SizedBox(
        width: width,
        child: Text(
            text,
            textAlign: TextAlign.center,
            style: const TextStyle(fontSize: 18, height: 1.8, fontWeight: FontWeight.bold)
        ),
      );
  }
}