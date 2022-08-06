import 'package:flutter/material.dart';

import 'const_String.dart';

class HeightContainer extends StatefulWidget {
  final String text;
  final String countText;
  String selected;

  final Function(int height) onChange;
  HeightContainer(
      {Key? key,
      required this.selected,
      required this.text,
      required this.countText,
      required this.onChange})
      : super(key: key);

  @override
  State<HeightContainer> createState() => _HeightContainerState();
}

class _HeightContainerState extends State<HeightContainer> {
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
        height: 150,
        padding: const EdgeInsets.all(10),
        decoration: decoration,
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceAround,
          children: [
            Text(
              widget.text,
              style: style,
            ),
            Row(
              crossAxisAlignment: CrossAxisAlignment.center,
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Text(
                  value.toString(),
                  style: TextStyle(
                      fontWeight: FontWeight.bold,
                      fontSize: 50,
                      color: widget.selected == Strings.male
                          ? UiColor.maleColor
                          : widget.selected == Strings.female
                              ? UiColor.femaleColor
                              : Colors.white),
                ),
                const Text(
                  Strings.cm,
                  style: TextStyle(fontSize: 14, color: Colors.grey),
                )
              ],
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
                    radius: 15,
                    backgroundColor: Colors.grey.shade500,
                    child: const Icon(
                      Icons.minimize,
                      color: Colors.white,
                      size: 10,
                    ),
                  ),
                ),
                const SizedBox(
                  width: 10,
                ),
                InkWell(
                  onTap: () {
                    setState(() {
                      value++;
                      widget.onChange(value);
                    });
                  },
                  child: CircleAvatar(
                    radius: 15,
                    backgroundColor: Colors.grey.shade500,
                    child: const Icon(Icons.add, color: Colors.white, size: 10),
                  ),
                )
              ],
            ),
          ],
        ));
  }
}
