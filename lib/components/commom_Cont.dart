import 'package:flutter/material.dart';

import 'const_String.dart';

class CommomContainer extends StatelessWidget {
  final Icon icon;
  final String text;
  const CommomContainer({Key? key, required this.icon, required this.text})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(10), color: UiColor.colorcont),
      height: 200,
      width: 200,
      child: Column(
        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          icon,
          Text(
            text,
            style: const TextStyle(
                color: Colors.grey, fontSize: 18, fontWeight: FontWeight.bold),
          )
        ],
      ),
    );
  }
}
