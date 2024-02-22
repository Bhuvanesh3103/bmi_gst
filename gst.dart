import 'package:flutter/material.dart';

class gst extends StatefulWidget {
  const gst({super.key});

  @override
  State<gst> createState() => _gstState();
}

class _gstState extends State<gst> {
  TextEditingController mainamount = TextEditingController();
  TextEditingController gstper = TextEditingController();

  double gstpersent = 0;
  double Igst = 0;
  double Cgst = 0;
  double Sgst = 0;
  double totalamount = 0;
  double Actualamount = 0;

  void calculategst() {
    setState(() {
      Igst = (Actualamount * gstpersent) / 100;
      Cgst = Igst / 2;
      Sgst = Igst / 2;
      totalamount = Actualamount + Igst;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('GST Calculator'),
      ),
      body: Column(
        children: [
          SizedBox(
            height: 40,
          ),
          Padding(
            padding: const EdgeInsets.all(12.0),
            child: TextFormField(
              controller: mainamount,
              decoration: InputDecoration(
                  hintText: 'Enter the amount',
                  border: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(9))),
              onChanged: (value) {
                setState(() {
                  Actualamount = double.parse(value) ?? 0.0;
                });
              },
            ),
          ),
          Padding(
            padding: const EdgeInsets.all(12.0),
            child: TextFormField(
              controller: gstper,
              decoration: InputDecoration(
                  hintText: 'GST Percentage',
                  border: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(9))),
              onChanged: (value) {
                setState(() {
                  gstpersent = double.parse(value) ?? 0.0;
                });
              },
            ),
          ),
          ElevatedButton(
              onPressed: () {
                setState(() {
                  Igst = (Actualamount * gstpersent) / 100;
                  Cgst = Igst / 2;
                  Sgst = Igst / 2;
                  totalamount = Actualamount + Igst;
                });
              },
              child: Text('IGST Calculate')),
          Padding(
            padding: const EdgeInsets.only(top: 20.0),
            child: ElevatedButton(
                onPressed: () {
                  setState(() {
                    Igst = (Actualamount * gstpersent) / (100+gstpersent);
                    totalamount = Actualamount - Igst;
                  });
                }, child: Text('EGST calculate')),
          ),
          SizedBox(
            height: 25,
          ),
          Text(
            'CGST amount: $Cgst',
            style: TextStyle(fontSize: 20),
          ),
          Text(
            'SGST amount: $Sgst',
            style: TextStyle(fontSize: 20),
          ),
          Text(
            'Total amount: $totalamount',
            style: TextStyle(fontSize: 20),
          ),
          Text(
            'Actual amount: $Actualamount',
            style: TextStyle(fontSize: 20),
          ),
          SizedBox(
            height: 40,
          ),
          IconButton(onPressed: (){
            setState(() {
              mainamount.text='';
              gstper.text='';
            });
          }, icon:Icon(Icons.replay_sharp))
        ],
      ),
    );
  }
}
