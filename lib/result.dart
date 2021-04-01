import 'package:flutter/material.dart';
import 'widget.dart';
import 'constants.dart';

class Result extends StatelessWidget {
  Result({@required this.bmi, @required this.getc, @required this.getcom});
  final String getc;
  final String getcom;
  final String bmi;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        title: Text('BMI CALCULATOR - RK'),
      ),
      body: Column(
        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: [
          Expanded(
            child: Center(
              child: Text(
                'Let\'s See Your BMI: ',
                style: TextStyle(
                  fontSize: 30,
                  fontWeight: FontWeight.w400,
                  height: 5,
                ),
              ),
            ),
          ),
          Expanded(
            flex: 5,
            child: NewWidget(
              colour: Color(0xff1d1e33),
              widget: Column(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  Text(
                    getc,
                    style: resultext,
                  ),
                  Text(
                    bmi,
                    style: resulttext,
                  ),
                  Text(
                    getcom,
                    textAlign: TextAlign.center,
                    style: ktextstyle,
                  )
                ],
              ),
            ),
          ),
          Expanded(
            flex: 1,
            child: GestureDetector(
              onTap: () {
                Navigator.pop(context);
              },
              child: Container(
                child: Center(
                  child: Text(
                    'RE-CALCULATE',
                    style: TextStyle(
                        fontSize: 30,
                        fontWeight: FontWeight.bold,
                        letterSpacing: 5),
                  ),
                ),
                margin: EdgeInsets.only(top: 20),
                // height: 20,
                width: double.infinity,

                decoration: BoxDecoration(
                    color: Color(0xffeb1555),
                    borderRadius: BorderRadius.circular(10.0)),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
