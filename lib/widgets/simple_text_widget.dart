import 'package:flutter/material.dart';

class SimpleText extends StatelessWidget {

  final String text;
  final double width;

  const SimpleText({super.key, required this.width, required this.text});

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: width,
      child: Text(
          text,
          textAlign: TextAlign.center,
          style: TextStyle(fontSize: 18, height: 1.8, color: Colors.blueGrey[700])
      ),
    );
  }
}