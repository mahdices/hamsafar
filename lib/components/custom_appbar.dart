import 'package:flutter/material.dart';

class CustomAppBar extends StatelessWidget with PreferredSizeWidget{

  final String title;


  const CustomAppBar(
      this.title,
      { Key? key,}) : preferredSize = const Size.fromHeight(50.0),
        super(key: key);
  @override
  Widget build(BuildContext context) {
    return AppBar(
      title: Text(
        title,
        style: const TextStyle(
            color: Colors.black, fontWeight: FontWeight.bold, fontSize: 18),
      ),
      foregroundColor: Colors.black,
      centerTitle: true,
      backgroundColor: Colors.white,
      elevation: 0,
      bottom: PreferredSize(
          child: Container(
            color: const Color(0xff707070).withOpacity(0.25),
            height: 1,
          ),
          preferredSize: const Size.fromHeight(1)),
    );
  }

  @override
  final Size preferredSize;

}