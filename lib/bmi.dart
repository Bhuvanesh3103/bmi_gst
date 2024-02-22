import 'package:flutter/material.dart';
class bmi extends StatefulWidget {
  const bmi({super.key});

  @override
  State<bmi> createState() => _bmiState();
}

class _bmiState extends State<bmi> {
  double height=170;
  double weight=75;
  int bmi=0;
  String condition = 'Select Data';
  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        body: SingleChildScrollView(
          child: Column(
            children: [
              Container(
                height: 290,
                width: double.infinity,
                decoration: BoxDecoration(
                    color: Colors.cyan.shade200
                ),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Padding(
                      padding: const EdgeInsets.only(left: 12.0,top: 20),
                      child: Text('BMI',style: TextStyle(
                          fontSize: 30,
                          fontWeight: FontWeight.bold),),
                    ),
                    Padding(
                      padding: const EdgeInsets.only(left: 12.0),
                      child: Text('Calculator',style: TextStyle(
                        fontSize: 25,
                      ),),
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.end,
                      children: [
                        Padding(
                          padding: const EdgeInsets.only(right: 30.0,top: 20),
                          child: Text('$bmi',style: TextStyle(
                              fontSize: 25,
                              fontWeight: FontWeight.bold),),
                        ),
                      ],

                    ),
                    Padding(
                        padding: const EdgeInsets.only(top: 40.0,left: 12),
                        child: RichText(
                          text: TextSpan(
                              text: 'Conditions:',style: TextStyle(fontSize: 25),
                              children: [
                                TextSpan(
                                  text: '$condition',style: TextStyle(fontSize: 25,fontWeight: FontWeight.bold),
                                )
                              ]

                          ),

                        )
                    ),

                  ],
                ),
              ),
              Container(
                width: double.infinity,
                child: Column(
                  children: [
                    Padding(
                      padding: const EdgeInsets.only(top: 20.0),
                      child: Text("Choose Data",style: TextStyle(
                          fontSize: 27,
                          fontWeight: FontWeight.bold),),
                    ),
                    SizedBox(
                      height: 90,
                    ),
                    RichText(
                      text: TextSpan(
                          text: 'Height:',style: TextStyle(fontSize: 25,color: Colors.black),
                          children: [
                            TextSpan(
                              text: '$height cm',style: TextStyle(fontSize: 25,fontWeight: FontWeight.bold,color: Colors.black),
                            )
                          ]

                      ),

                    ),
                    SizedBox(
                      height: 20,
                    ),
                    Slider(value: height,
                      min: 0,
                      max: 250,
                      onChanged: (_height){
                        setState(() {
                          height=_height;
                        });
                      },
                      divisions: 250,
                      label: '$height',
                    ),
                    SizedBox(
                      height: 50,
                    ),
                    RichText(
                      text: TextSpan(
                          text: 'Weight:',style: TextStyle(fontSize: 25,color: Colors.black),
                          children: [
                            TextSpan(
                              text: '$weight kg',style: TextStyle(fontSize: 25,fontWeight: FontWeight.bold,color: Colors.black),
                            )
                          ]

                      ),

                    ),
                    SizedBox(
                      height: 20,
                    ),
                    Slider(value: weight,
                      min: 0,
                      max: 300,
                      onChanged: (_weight){
                        setState(() {
                          weight=_weight;
                        });
                      },
                      divisions: 300,
                      label: '$weight',
                    ),
                  ],
                ),
              ),
              SizedBox(
                height: 80,
              ),
              ElevatedButton(onPressed: (){
                setState(() {
                  bmi=(weight/((height/100)*(height/100))).round().toInt();
                  if(bmi>=18.5 && bmi<=25){
                    condition="Normal";
                  }
                  else
                  if(bmi>=25 && bmi<=30){
                    condition="Overweight";
                  }
                  else
                  if(bmi>30){
                    condition='Obesity';
                  }
                  else {
                    condition='Underweight';
                  }
                });
              }, child: Text('Calculate'))
            ],
          ),
        ),
      ),
    );
  }
}
