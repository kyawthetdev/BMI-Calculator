import 'package:bmi/constants.dart';
import 'package:bmi/pages/BmiBrain.dart';
import 'package:bmi/pages/Result.dart';
import 'package:bmi/pages/Reusable.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

enum Gender { male, female }

int height = 180;
int weight = 60;
int age = 21;

class BmiPage extends StatefulWidget {
  @override
  _BmiPageState createState() => _BmiPageState();
}

class _BmiPageState extends State<BmiPage> {
  Gender pickedGender;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: Text('BMI Calculator',
              style:
                  TextStyle(fontFamily: 'google', fontWeight: FontWeight.w900)),
          centerTitle: true,
        ),
        body: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            Expanded(
              child: Row(
                children: [
                  Expanded(
                      child: Reusable.reUsableCard(
                    onPress: () {
                      setState(() {
                        pickedGender = Gender.male;
                      });
                    },
                    colour: pickedGender == Gender.male
                        ? kActiveCardColor
                        : kInactiveCardColor,
                    childWidget: Reusable.reUsableWidget(
                        icon: FontAwesomeIcons.mars, label: 'MALE'),
                  )),
                  Expanded(
                    child: Reusable.reUsableCard(
                        onPress: () {
                          setState(() {
                            pickedGender = Gender.female;
                          });
                        },
                        colour: pickedGender == Gender.female
                            ? kActiveCardColor
                            : kInactiveCardColor,
                        childWidget: Reusable.reUsableWidget(
                            icon: FontAwesomeIcons.venus, label: 'FEMALE')),
                  )
                ],
              ),
            ),
            Expanded(
                child: Reusable.reUsableCard(
                    colour: kInactiveCardColor,
                    childWidget: Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Text(
                          'HEIGHT',
                          style: kLabelTextStyle,
                        ),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          crossAxisAlignment: CrossAxisAlignment.baseline,
                          /*if you need you can use => textBaseline:TextBaseline.alphabetic,*/
                          textBaseline: TextBaseline.alphabetic,
                          children: [
                            Text(
                              '$height',
                              style: kNumberTextStyle,
                            ),
                            Text(
                              'cm',
                              style: kLabelTextStyle,
                            )
                          ],
                        ),
                        _buildHeightSlider()
                      ],
                    ))),
            Expanded(
              child: Row(
                children: [
                  Expanded(
                      child: Reusable.reUsableCard(
                          colour: kInactiveCardColor,
                          childWidget: Column(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              Text(
                                'WEIGHT',
                                style: kLabelTextStyle,
                              ),
                              Text(
                                '$weight',
                                style: kNumberTextStyle,
                              ),
                              Row(
                                mainAxisAlignment: MainAxisAlignment.center,
                                children: [
                                  Reusable.reusableRoundIconButton(
                                      icon: Icon(FontAwesomeIcons.minus),
                                      onPressed: () {
                                        setState(() {
                                          weight--;
                                        });
                                      }),
                                  SizedBox(width: 10.0),
                                  Reusable.reusableRoundIconButton(
                                      icon: Icon(FontAwesomeIcons.plus),
                                      onPressed: () {
                                        setState(() {
                                          weight++;
                                        });
                                      }),
                                ],
                              )
                            ],
                          ))),
                  Expanded(
                      child: Reusable.reUsableCard(
                          colour: kInactiveCardColor,
                          childWidget: Column(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              Text(
                                'AGE',
                                style: kLabelTextStyle,
                              ),
                              Text(
                                '$age',
                                style: kNumberTextStyle,
                              ),
                              Row(
                                mainAxisAlignment: MainAxisAlignment.center,
                                children: [
                                  Reusable.reusableRoundIconButton(
                                      icon: Icon(FontAwesomeIcons.minus),
                                      onPressed: () {
                                        setState(() {
                                          age--;
                                        });
                                      }),
                                  SizedBox(width: 10.0),
                                  Reusable.reusableRoundIconButton(
                                      icon: Icon(FontAwesomeIcons.plus),
                                      onPressed: () {
                                        setState(() {
                                          age++;
                                        });
                                      }),
                                ],
                              )
                            ],
                          )))
                ],
              ),
            ),
            Reusable.reusableButton(
                label: 'CALCULATE',
                onPressed: () {
                  BmiBrain bmiBrain = BmiBrain(height: height, weight: weight);
                  Navigator.push(context, MaterialPageRoute(builder: (context) {
                    return Result(
                      bmiResult: bmiBrain.calculateBMI(),
                      resultText: bmiBrain.getResult(),
                      interpretationText: bmiBrain.getInterpretation(),
                    );
                  }));
                }),
          ],
        ));
  }

  Widget _buildHeightSlider() {
    return SliderTheme(
      data: SliderTheme.of(context).copyWith(
          trackHeight: 2.0,
          activeTrackColor: kBottomContainerColor,
          thumbColor: kBottomContainerColor,
          overlayColor: kOverLayColor,
          thumbShape: RoundSliderThumbShape(enabledThumbRadius: 10.0),
          overlayShape: RoundSliderOverlayShape(overlayRadius: 20.0),
          inactiveTrackColor: kLabelColor),
      child: Slider(
        value: height.toDouble(),
        min: 120.0,
        max: 220.0,
        onChanged: (double newValue) {
          setState(() {
            height = newValue.round();
          });
        },
      ),
    );
  }
}
