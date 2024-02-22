import 'package:flutter/material.dart';
import 'dart:math';

import 'bmi.dart';
import 'bottom.dart';
import 'gst.dart';

void main() => runApp(MaterialApp(
  debugShowCheckedModeBanner: false,
  home: botnavi(),
));

class calc extends StatefulWidget {
  const calc({super.key});

  @override
  State<calc> createState() => _calcState();
}

class _calcState extends State<calc> {
  String val1 = "", val2 = "", optr = "";
  bool clk = false;

  final ctrl = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Calculator'),
      ),
      body: Column(
        mainAxisAlignment: MainAxisAlignment.end,
        children: [
          SizedBox(
            height: 50,
          ),
          Padding(
            padding: const EdgeInsets.all(15.0),
            child: TextFormField(
              controller: ctrl,
              textAlign: TextAlign.right,
              decoration: InputDecoration(
                hintText: '0',
                border:
                OutlineInputBorder(borderRadius: BorderRadius.circular(8)),
              ),
            ),
          ),
          SizedBox(
            height: 30,
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: [
              ElevatedButton(
                style: ElevatedButton.styleFrom(
                    minimumSize: Size(100,50)
                ),
                onPressed: () {
                  if (ctrl.text.isNotEmpty) {
                    setState(() {
                      ctrl.text = ctrl.text.substring(0,
                          ctrl.text.length - 1);
                    });
                  }
                },
                child: Icon(Icons.cancel_presentation),
              ),
              ElevatedButton(
                  style: ElevatedButton.styleFrom(
                      minimumSize: Size(100, 50)
                  ),
                  onPressed: () {
                    if (ctrl.text.isNotEmpty && ctrl.text != "0") {
                      // Check if the input field is not empty and not zero
                      setState(() {
                        if (ctrl.text.startsWith("-")) {
                          // If the number is negative, remove the "-" sign
                          ctrl.text = ctrl.text.substring(1);
                        } else {
                          // If the number is positive, add a "-" sign
                          ctrl.text = "-" + ctrl.text;
                        }
                      });
                    }
                  },
                  child: Text("+/-")),
            ],
          ),
          SizedBox(
            height: 30,
          ),
          //1st line
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: [
              ElevatedButton(
                  onPressed: () {
                    setState(() {
                      val1 = "";
                      val2 = "";
                      optr = "";
                      clk = false;
                      ctrl.text = "0";
                    });
                  },
                  child: Text("AC")),
              ElevatedButton(onPressed: () {
                ctrl.text = "√";
                optr = "√";
                clk = true;
              }, child: Text("√")),
              ElevatedButton(
                  onPressed: () {
                    ctrl.text = "%";
                    optr = "%";
                    clk = true;
                  },
                  child: Text("%")),
              ElevatedButton(
                  onPressed: () {
                    ctrl.text = "/";
                    optr = "/";
                    clk = true;
                  },
                  child: Text("/")),
            ],
          ),
          SizedBox(
            height: 30,
          ),

          //2nh line
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: [
              ElevatedButton(
                  onPressed: () {
                    if (clk == false) {
                      val2 += "7";
                      ctrl.text = val2;
                    } else {
                      val1 += "7";
                      ctrl.text = val1;
                    }
                  },
                  child: Text("7")),
              ElevatedButton(
                  onPressed: () {
                    if (clk == false) {
                      val2 += "8";
                      ctrl.text = val2;
                    } else {
                      val1 += "8";
                      ctrl.text = val1;
                    }
                  },
                  child: Text("8")),
              ElevatedButton(
                  onPressed: () {
                    if (clk == false) {
                      val2 += "9";
                      ctrl.text = val2;
                    } else {
                      val1 += "9";
                      ctrl.text = val1;
                    }
                  },
                  child: Text("9")),
              ElevatedButton(
                  onPressed: () {
                    ctrl.text = "*";
                    optr = "*";
                    clk = true;
                  },
                  child: Text("x")),
            ],
          ),
          SizedBox(
            height: 30,
          ),

          //3rd line
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: [
              ElevatedButton(
                  onPressed: () {
                    if (clk == false) {
                      val2 += "4";

                      ctrl.text = val2;
                    } else {
                      val1 += "4";
                      ctrl.text = val1;
                    }
                  },
                  child: Text("4")),
              ElevatedButton(
                  onPressed: () {
                    if (clk == false) {
                      val2 += "5";

                      ctrl.text = val2;
                    } else {
                      val1 += "5";
                      ctrl.text = val1;
                    }
                  },
                  child: Text("5")),
              ElevatedButton(
                  onPressed: () {
                    if (clk == false) {
                      val2 += "6";

                      ctrl.text = val2;
                    } else {
                      val1 += "6";
                      ctrl.text = val1;
                    }
                  },
                  child: Text("6")),
              ElevatedButton(
                  onPressed: () {
                    ctrl.text = "-";
                    optr = "-";

                    clk = true;
                  },
                  child: Text("-")),
            ],
          ),
          SizedBox(
            height: 30,
          ),

          //4th line
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: [
              ElevatedButton(
                  onPressed: () {
                    if (clk == false) {
                      val2 += "1";
                      ctrl.text = val2;
                    } else {
                      val1 += "1";
                      ctrl.text = val1;
                    }
                  },
                  child: Text("1")),
              ElevatedButton(
                  onPressed: () {
                    if (clk == false) {
                      val2 += "2";
                      ctrl.text = val2;
                    } else {
                      val1 += "2";
                      ctrl.text = val1;
                    }
                  },
                  child: Text("2")),
              ElevatedButton(
                  onPressed: () {
                    if (clk == false) {
                      val2 += "3";
                      ctrl.text = val2;
                    } else {
                      val1 += "3";
                      ctrl.text = val1;
                    }
                  },
                  child: Text("3")),
              ElevatedButton(
                  onPressed: () {
                    ctrl.text = "+";
                    optr = "+";
                    clk = true;
                  },
                  child: Text("+")),
            ],
          ),
          SizedBox(
            height: 30,
          ),

          //last line
          Padding(
            padding: const EdgeInsets.only(bottom: 10.0),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                ElevatedButton(onPressed: () {
                  ctrl.text = "x²";
                  optr = "x²";
                  clk = true;
                }, child: Text("x²")),
                ElevatedButton(
                    onPressed: () {
                      if (clk == false) {
                        val2 += '0';
                        ctrl.text = val2;
                      } else {
                        val1 += '0';
                        ctrl.text = val1;
                      }
                    },
                    child: Text("0")),
                ElevatedButton(onPressed: () {}, child: Text(".")),
                ElevatedButton(
                    onPressed: () {
                      if (optr == '+') {
                        int a = int.parse(val1);
                        int b = int.parse(val2);
                        int res = 0;
                        res = a + b;
                        ctrl.text = res.toString();
                      }
                      if (optr == '-') {
                        int a = int.parse(val2);
                        int b = int.parse(val1);
                        int res = 0;
                        res = a - b;
                        ctrl.text = res.toString();
                      }
                      if (optr == '*') {
                        int a = int.parse(val2);
                        int b = int.parse(val1);
                        int res = 0;
                        res = a * b;
                        ctrl.text = res.toString();
                      }
                      if (optr == '/') {
                        double a = double.parse(val2);
                        double b = double.parse(val1);
                        double res = 0;
                        res = a / b;
                        ctrl.text = res.toString();
                      }
                      if (optr == '%') {
                        double a = double.parse(val2);
                        double b = double.parse(val1);
                        double res = 0;
                        res = a * b / 100;
                        ctrl.text = res.toString();
                      }
                      if (optr == '√') {
                        double value = double.parse(ctrl.text);
                        double result = sqrt(value);
                        ctrl.text = result.toString();
                      } else if (optr == 'x²') {
                        double value = double.parse(ctrl.text);
                        double result = value * value;
                        ctrl.text = result.toString();
                      }
                    },
                    child: Text("=")),
              ],
            ),
          )
        ],
      ),
    );
  }
}
