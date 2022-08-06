import 'dart:developer';

import 'package:flutter/material.dart';

import 'components/const_String.dart';
import 'components/main_body.dart';
import 'result_Page.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatefulWidget {
  const MyApp({
    Key? key,
  }) : super(key: key);

  @override
  State<MyApp> createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  int height = 0;

  int weight = 0;

  void setHeight(value) {
    height = value;
  }

  void setWeight(value) {
    weight = value;
  }

  //BMI = weight/height^2
  double calculateBMI(int weight, int height) {
    var heightinft = height * 0.03;
    double bmi = weight / (heightinft * heightinft);
    return bmi;
  }

  String selected = "";

  void setSelected(value) {
    selected = value;
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: SafeArea(
        child: Scaffold(
          backgroundColor: UiColor.colorbody,
          appBar: AppBar(
            backgroundColor: UiColor.colorbody,
            title: const Text(Strings.bmical),
            centerTitle: true,
          ),
          body: MainBody(
              setHeight: setHeight,
              setWeight: setWeight,
              selected: selected,
              setSelected: setSelected),
          bottomNavigationBar: Builder(
            builder: (context) {
              return InkWell(
                onTap: () {
                  setState(() {});
                  var bmi = calculateBMI(weight, height);
                  Navigator.of(context).push(
                    MaterialPageRoute(
                      builder: (context) {
                        return ResultsPage(
                            bmiResult: bmi,
                            selected: selected,
                            height: height,
                            weight: weight,);
                      },
                    ),
                  );
                },
                child: SizedBox(
                  width: double.infinity,
                  child: Container(
                    height: 50,
                    padding: const EdgeInsets.all(10),
                    color: selected == Strings.male
                        ? UiColor.maleColor
                        : selected == Strings.female
                            ? UiColor.femaleColor
                            : Colors.grey,
                    child: const Text(
                      Strings.calculate,
                      textAlign: TextAlign.center,
                      style: TextStyle(
                          color: Colors.white,
                          fontSize: 18,
                          fontWeight: FontWeight.bold),
                    ),
                  ),
                ),
              );
            },
          ),
        ),
      ),
    );
  }
}
