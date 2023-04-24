import 'package:flutter/material.dart';

class CustomHeading extends StatelessWidget {
  final String title;
  final String? alignment;
  const CustomHeading({
    Key? key,
    required this.title,
    this.alignment,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      alignment: Alignment.center,
      padding: const EdgeInsets.symmetric(horizontal: 22, vertical:25 ),
      child: Text(
        title,
        style: const TextStyle(
            fontSize: 30,
            fontWeight: FontWeight.bold,
            fontFamily: 'NotoSerif'
        ),
      ),
    );
  }
}
