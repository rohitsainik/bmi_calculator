import 'dart:ffi';

import 'package:bmi_calculator/ui/help.dart';
import 'package:flutter/material.dart';

class Bmi extends StatefulWidget {
  @override
  State<StatefulWidget> createState() {
    return new BmiState();
  }
}

class BmiState extends State<Bmi> {
  final TextEditingController _heightController = new TextEditingController();
  final TextEditingController _weightController = new TextEditingController();
  double cm = 0.0;
  double result = 0.0;
  String _resultReading = "";
  double kg = 0.0;

  String _finalResult = "";

  void _calculateBMI() {

    setState(() {
      double height = double.parse(_heightController.text);
      cm = height / 100;
      double weight = double.parse(_weightController.text);
      

      if (((_heightController.text.isNotEmpty || cm > 0)
              && (_weightController.text.isNotEmpty || weight > 0))) {
        result = weight / (cm * cm) ; // our BMI
        
        //Do the reading
        if (double.parse(result.toStringAsFixed(1)) < 18.5) {
          _resultReading = "Underweight";
          print(_resultReading);
        } else if (double.parse(result.toStringAsFixed(1)) >= 18.5
            && result < 25) {
          _resultReading = "Great Shape!"; // Normal
          print(_resultReading);
        } else if (double.parse(result.toStringAsFixed(1)) >= 25.0
            && result < 30) {
          _resultReading = "Overweight";
        } else if (double.parse(result.toStringAsFixed(1)) >= 30.0) {
          _resultReading = "Obese";
        }
      } else {
        result = 0.0;
      }
    });
    _finalResult = "Your BMI: ${result.toStringAsFixed(1)}";
  }

  @override
  Widget build(BuildContext context) {
    return new Scaffold(
      appBar: new AppBar(
        title: new Text('BMI'),
        centerTitle: true,
        backgroundColor: Colors.blueAccent,
        actions: <Widget>[
          IconButton(icon: Icon(Icons.info), onPressed: () {
            Navigator.push(
                context, MaterialPageRoute(builder: (context) => helpDesk()));
          })
        ],
      ),
      body: new Container(
        alignment: Alignment.topCenter,
        child: new ListView(
          padding: const EdgeInsets.all(5.0),
          children: <Widget>[
            new Image.asset(
              'images/bmilogo.png',
              height: 85.0,
              width: 75.0,
            ),
            new Container(
              margin: const EdgeInsets.all(3.0),
              height: MediaQuery
                  .of(context)
                  .size
                  .height - 450.0,
              width: 290.0,
              color: Colors.grey.shade300,
              child: new Column(
                children: <Widget>[
                  Center(
                    child: Text("Enter Your Values",style: TextStyle(fontWeight: FontWeight.bold,fontSize: 25.0,color: Colors.blue),),
                  ),

                  new TextField(
                      controller: _heightController,
                      keyboardType: TextInputType.number,
                      decoration: new InputDecoration(
                          labelText: 'Height in CentiMeter',
                          hintText: 'e.g 120',
                          icon: new Icon(Icons.insert_chart))),
                  new TextField(
                      controller: _weightController,
                      keyboardType: TextInputType.number,
                      decoration: new InputDecoration(
                          labelText: 'Weight in Kilogram',
                          hintText: 'e.g 80',
                          icon: new Icon(Icons.line_weight))),

                  new Padding(padding: new EdgeInsets.all(10.6)),
                  //calculate button
                  new Container(
                    alignment: Alignment.center,
                    child: new RaisedButton(
                      onPressed: () {
                        _calculateBMI();
                        _weightController.clear();
                        _heightController.clear();
                      },
                      color: Colors.pinkAccent,
                      child: new Text('Calculate'),
                      textColor: Colors.white,
                    ),
                  )
                ],
              ),
            ),
            SizedBox(height: 10.0,),
            new Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: <Widget>[
                new Text("$_finalResult ",
                  style: new TextStyle(
                      color: Colors.blueAccent,
                      fontWeight: FontWeight.w500,
                      fontStyle: FontStyle.italic,
                      fontSize: 19.9
                  ),),

                new Padding(padding: const EdgeInsets.all(5.0)),

                new Text("$_resultReading ",
                  style: new TextStyle(
                      color: Colors.pinkAccent,
                      fontWeight: FontWeight.w500,
                      fontStyle: FontStyle.italic,
                      fontSize: 19.9
                  ),)
              ],
            ),
          ],
        ),
      ),
    );
  }
}
