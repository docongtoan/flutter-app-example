import 'package:flutter/material.dart';

class CustomLoading extends StatelessWidget {
  final bool valueShow;
  const CustomLoading({Key? key, required this.valueShow}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
        alignment: Alignment.center,
        padding: const EdgeInsets.symmetric(horizontal: 22, vertical: 25),
        child: Text('123123'));
  }
}
