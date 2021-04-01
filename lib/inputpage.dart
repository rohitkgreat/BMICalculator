import 'package:bmi/result.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'constants.dart';
import 'widget.dart';
import 'calc.dart';

const activecolor = Color(0xff1d1e33);
const inactivecolor = Color(0xff111328);
enum Gender {
  male,
  female,
}

class Bmi extends StatefulWidget {
  @override
  _BmiState createState() => _BmiState();
}

class _BmiState extends State<Bmi> {
  Color malewidget = inactivecolor;
  Color femalewidget = inactivecolor;
  int height = 180;
  int weight = 60;
  int age = 24;

  Gender selectedgender;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          centerTitle: true,
          title: Text('BMI CALCULATOR - RK'),
        ),
        body: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: <Widget>[
            Expanded(
              flex: 2,
              child: Row(
                children: <Widget>[
                  Expanded(
                    child: NewWidget(
                      onPress: () {
                        setState(() {
                          selectedgender = Gender.male;
                        });
                      },
                      colour: selectedgender == Gender.male
                          ? activecolor
                          : inactivecolor,
                      widget: NWidget(
                        icons: FontAwesomeIcons.mars,
                        text: 'MALE',
                      ),
                    ),
                  ),
                  Expanded(
                    child: NewWidget(
                      onPress: () {
                        setState(() {
                          selectedgender = Gender.female;
                        });
                      },
                      colour: selectedgender == Gender.female
                          ? activecolor
                          : inactivecolor,
                      widget: NWidget(
                        icons: FontAwesomeIcons.venus,
                        text: 'FEMALE',
                      ),
                    ),
                  ),
                ],
              ),
            ),
            Expanded(
              flex: 2,
              child: NewWidget(
                colour: Color(0xff1d1e33),
                widget: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Text(
                      'HEIGHT',
                      style: ktextstyle,
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      crossAxisAlignment: CrossAxisAlignment.baseline,
                      textBaseline: TextBaseline.alphabetic,
                      children: [
                        Text(
                          height.toString(),
                          style: knumtextstyle,
                        ),
                        Text(
                          'cm',
                          style: ktextstyle,
                        )
                      ],
                    ),
                    Slider(
                        value: height.toDouble(),
                        activeColor: Colors.red,
                        inactiveColor: Color(0xff8d8e98),
                        min: 120.0,
                        max: 220.0,
                        onChanged: (double newvalue) {
                          setState(() {
                            height = newvalue.round();
                          });
                        }),
                  ],
                ),
              ),
            ),
            Expanded(
              flex: 2,
              child: Row(
                children: <Widget>[
                  Expanded(
                    child: NewWidget(
                      colour: Color(0xff1d1e33),
                      widget: Column(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Text(
                            'WEIGHT',
                            style: ktextstyle,
                          ),
                          Row(
                            mainAxisAlignment: MainAxisAlignment.center,
                            crossAxisAlignment: CrossAxisAlignment.baseline,
                            textBaseline: TextBaseline.alphabetic,
                            children: [
                              Text(
                                weight.toString(),
                                style: knumtextstyle,
                              ),
                              Text(
                                'Kg',
                                style: ktextstyle,
                              )
                            ],
                          ),
                          Row(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              Roundbutton(
                                icon: FontAwesomeIcons.minus,
                                onpress: () {
                                  setState(() {
                                    weight--;
                                  });
                                },
                              ),
                              SizedBox(
                                width: 40,
                              ),
                              Roundbutton(
                                icon: FontAwesomeIcons.plus,
                                onpress: () {
                                  setState(() {
                                    weight++;
                                  });
                                },
                              )
                            ],
                          ),
                        ],
                      ),
                    ),
                  ),
                  Expanded(
                    child: NewWidget(
                      colour: Color(0xff1d1e33),
                      widget: Column(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Text(
                            'AGE',
                            style: ktextstyle,
                          ),
                          Text(
                            age.toString(),
                            style: knumtextstyle,
                          ),
                          Row(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              Roundbutton(
                                  icon: FontAwesomeIcons.minus,
                                  onpress: () {
                                    setState(() {
                                      age--;
                                    });
                                  }),
                              SizedBox(
                                width: 40,
                              ),
                              Roundbutton(
                                  icon: FontAwesomeIcons.plus,
                                  onpress: () {
                                    setState(() {
                                      age++;
                                    });
                                  })
                            ],
                          )
                        ],
                      ),
                    ),
                  ),
                ],
              ),
            ),
            SizedBox(
              height: 10,
            ),
            Expanded(
              flex: 1,
              child: GestureDetector(
                onTap: () {
                  Calc bmii = Calc(height: height, weight: weight);

                  Navigator.push(
                    context,
                    MaterialPageRoute(
                      builder: (context) => Result(
                        bmi: bmii.bmi(),
                        getc: bmii.getc(),
                        getcom: bmii.getcom(),
                      ),
                    ),
                  );
                },
                child: Container(
                  child: Center(
                    child: Text(
                      'CALCULATE',
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
                      color: Colors.blue.shade700,
                      borderRadius: BorderRadius.circular(10.0)),
                ),
              ),
            ),
          ],
        ));
  }
}
