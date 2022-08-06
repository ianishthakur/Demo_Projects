import 'package:flutter/material.dart';

import 'const_String.dart';

class CountContainer extends StatefulWidget {
  final String text;
  final String countText;
  final Function(int value) onChange;
  String selected;
  CountContainer({
    Key? key,
    required this.text,
    required this.countText,
    required this.onChange,
    required this.selected,
  }) : super(key: key);

  @override
  State<CountContainer> createState() => _CountContainerState();
}

class _CountContainerState extends State<CountContainer> {
  int value = 0;
  @override
  Widget build(BuildContext context) {
    final Decoration decoration = BoxDecoration(
        borderRadius: BorderRadius.circular(10),
        color: UiColor.colorcont,
        shape: BoxShape.rectangle);
    const TextStyle style = TextStyle(
      color: Colors.grey,
      fontSize: 18,
    );
    return Container(
      height: 200,
      width: 200,
      padding: const EdgeInsets.all(10),
      decoration: decoration,
      child: Column(
        mainAxisAlignment: MainAxisAlignment.spaceAround,
        children: [
          Text(
            widget.text,
            style: style,
          ),
          Text(
            value.toString(),
            style: TextStyle(
              fontSize: 40,
              color: widget.selected == Strings.male
                  ? UiColor.maleColor
                  : widget.selected == Strings.female
                      ? UiColor.femaleColor
                      : Colors.white,
              fontWeight: FontWeight.bold,
            ),
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              InkWell(
                onTap: () {
                  setState(() {
                    if (value > 0) {
                      value--;
                      widget.onChange(value);
                    }
                  });
                },
                child: CircleAvatar(
                  radius: 20,
                  backgroundColor: Colors.grey.shade500,
                  child: const Icon(
                    Icons.minimize,
                    color: Colors.white,
                    size: 18,
                  ),
                ),
              ),
              const SizedBox(
                width: 15,
              ),
              InkWell(
                onTap: () {
                  setState(() {
                    value++;
                    widget.onChange(value);
                  });
                },
                child: CircleAvatar(
                  radius: 20,
                  backgroundColor: Colors.grey.shade500,
                  child: const Icon(Icons.add, color: Colors.white, size: 18),
                ),
              )
            ],
          )
        ],
      ),
    );
  }
}
