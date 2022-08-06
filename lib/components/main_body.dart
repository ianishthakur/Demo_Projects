import 'dart:developer';

import 'package:calculator/components/commom_Cont.dart';
import 'package:calculator/components/height_cont.dart';
import 'package:flutter/material.dart';

import 'const_String.dart';
import 'count_Cont.dart';

class MainBody extends StatefulWidget {
  final Function(int height) setHeight;
  final Function(int weight) setWeight;
  String selected;
  Function? setSelected;
  MainBody(
      {Key? key,
      required this.setHeight,
      required this.setWeight,
      required this.selected,
      required this.setSelected})
      : super(key: key);

  @override
  State<MainBody> createState() => _MainBodyState();
}

class _MainBodyState extends State<MainBody> {
  @override
  Widget build(BuildContext context) {
    // const TextStyle style = TextStyle(
    //     color: Colors.grey, fontSize: 16, fontWeight: FontWeight.bold);
    // final Decoration decoration = BoxDecoration(
    //   shape: BoxShape.rectangle,
    //   color: UiColor.colorcont,
    //   borderRadius: BorderRadius.circular(10),
    // );

    return Column(
      children: [
        Padding(
          padding: const EdgeInsets.all(15),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceAround,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              Expanded(
                child: GestureDetector(
                  onTap: () {
                    widget.setSelected!(Strings.male);
                    setState(() {
                      widget.selected = Strings.male;
                    });
                    log(widget.selected);
                  },
                  child: CommomContainer(
                    icon: Icon(
                      Icons.male_outlined,
                      color: widget.selected == Strings.male
                          ? UiColor.maleColor
                          : Colors.white,
                      size: 130,
                    ),
                    text: Strings.male,
                  ),
                ),
              ),
              const SizedBox(
                width: 20,
              ),
              Expanded(
                child: GestureDetector(
                  onTap: () {
                    widget.setSelected!(Strings.female);
                    setState(() {
                      widget.selected = Strings.female;
                    });
                  },
                  child: CommomContainer(
                    icon: Icon(
                      Icons.female_outlined,
                      color: widget.selected == Strings.female
                          ? UiColor.femaleColor
                          : Colors.white,
                      size: 130,
                    ),
                    text: Strings.female,
                  ),
                ),
              ),
            ],
          ),
        ),
        Padding(
          padding: const EdgeInsets.all(15),
          child: HeightContainer(
            text: Strings.height,
            countText: '0',
            selected: widget.selected,
            onChange: (int height) {
              widget.setHeight(height);
            },
          ),
        ),
        Padding(
          padding: const EdgeInsets.all(15),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Expanded(
                child: CountContainer(
                  selected: widget.selected,
                  text: Strings.weight,
                  countText: "0",
                  onChange: widget.setWeight,
                ),
              ),
              const SizedBox(
                width: 20,
              ),
              Expanded(
                child: CountContainer(
                  selected: widget.selected,
                  onChange: (value) {},
                  text: Strings.age,
                  countText: "28",
                ),
              )
            ],
          ),
        )
      ],
    );
  }
}
