import 'package:flutter/material.dart';

import 'components/const_String.dart';

class ResultsPage extends StatefulWidget {
  final double bmiResult;

  String selected;
  final height;
  final weight;
  ResultsPage({
    Key? key,
    required this.selected,
    required this.bmiResult,
    required this.height,
    required this.weight,
  }) : super(key: key);

  @override
  State<ResultsPage> createState() => _ResultsPageState();
}

class _ResultsPageState extends State<ResultsPage> {
  @override
  Widget build(BuildContext context) {
    // log('hhhg ${widget.bmi.toString()}');
    return Scaffold(
      backgroundColor: UiColor.colorbody,
      appBar: AppBar(
        backgroundColor: UiColor.colorbody,
        title: const Text(Strings.result),
        centerTitle: true,
      ),
      body: StatefulBuilder(
        builder: (BuildContext context, StateSetter setState) {
          return Column(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Padding(
                padding: const EdgeInsets.all(20.0),
                child: Column(
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: [
                      Padding(
                        padding: EdgeInsets.zero,
                        child: Text(
                          widget.bmiResult.toStringAsFixed(2) == "NaN"
                              ? "0"
                              : widget.bmiResult.toStringAsFixed(2),
                          style: TextStyle(
                            color: widget.selected == Strings.male
                                ? UiColor.maleColor
                                : widget.selected == Strings.female
                                    ? UiColor.femaleColor
                                    : Colors.white,
                            fontSize: 80,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                      ),
                      const Padding(
                        padding: EdgeInsets.all(8.0),
                        child: Text(
                          textAlign: TextAlign.center,
                          Strings.statement,
                          style: TextStyle(
                            color: Colors.green,
                            fontSize: 25,
                          ),
                        ),
                      ),
                      const SizedBox(
                        width: 10,
                      ),
                      const Text(
                        Strings.goodjob,
                        style: TextStyle(
                          color: Colors.green,
                          fontSize: 25,
                        ),
                      ),
                    ]),
              ),
              Align(
                  alignment: Alignment.bottomCenter,
                  child: InkWell(
                    onTap: () {
                      Navigator.of(context).pop();
                    },
                    child: Container(
                      width: double.infinity,
                      color: widget.selected == Strings.male
                          ? UiColor.maleColor
                          : widget.selected == Strings.female
                              ? UiColor.femaleColor
                              : Colors.white,
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.end,
                        crossAxisAlignment: CrossAxisAlignment.center,
                        children: [
                          Container(
                            height: 50,
                            padding: const EdgeInsets.all(10),
                            color: widget.selected == Strings.male
                                ? UiColor.maleColor
                                : widget.selected == Strings.female
                                    ? UiColor.femaleColor
                                    : Colors.white,
                            child: const Text(
                              Strings.recal,
                              textAlign: TextAlign.center,
                              style: TextStyle(
                                  color: Colors.white,
                                  fontSize: 18,
                                  fontWeight: FontWeight.bold),
                            ),
                          ),
                        ],
                      ),
                    ),
                  )),
            ],
          );
        },
      ),
    );
  }
}
