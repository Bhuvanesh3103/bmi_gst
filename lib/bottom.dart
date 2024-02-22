import 'package:flutter/material.dart';

import 'bmi.dart';
import 'gst.dart';
import 'main.dart';
class botnavi extends StatefulWidget {
  const botnavi({super.key});

  @override
  State<botnavi> createState() => _botnaviState();
}

class _botnaviState extends State<botnavi> {
  int _index=0;

  final page=[
    calc(),
    bmi(),
    gst(),
  ];

  void tap(index){
    setState(() {
      _index=index;
    });
  }


  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: page[_index],
      bottomNavigationBar: BottomNavigationBar(
        items: [
          BottomNavigationBarItem(icon: Icon(Icons.calculate_sharp),
              label: 'Calculator'),
          BottomNavigationBarItem(icon: Icon(Icons.cabin_sharp),
              label: 'BMI'
          ),
          BottomNavigationBarItem(icon: Icon(Icons.calendar_month),
              label: 'GST'
          )
        ],
        currentIndex: _index,
        onTap: tap,
      ),
    );
  }
}
