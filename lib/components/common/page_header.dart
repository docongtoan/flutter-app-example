import 'package:flutter/material.dart';

class PageHeader extends StatefulWidget{

  const PageHeader({Key? key}) : super(key: key);

  @override
  State<PageHeader> createState() => _PageHeaderState();
}

class _PageHeaderState extends State<PageHeader>{
  @override
  Widget build(BuildContext context){
      Size size = MediaQuery.of(context).size;
      return SizedBox(
        width: double.infinity,
        height: size.height * 0.3,
        child: Image.asset("assets/images/logo.png"),
      );
  }
}