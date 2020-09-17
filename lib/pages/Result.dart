import 'package:bmi/constants.dart';
import 'package:bmi/pages/Reusable.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class Result extends StatelessWidget {
  Result(
      {@required this.bmiResult,
      @required this.resultText,
      @required this.interpretationText});

  final String bmiResult;
  final String resultText;
  final String interpretationText;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('BMI Calculator',
            style:
                TextStyle(fontFamily: 'google', fontWeight: FontWeight.w900)),
        centerTitle: true,
        leading: IconButton(
          icon: Icon(CupertinoIcons.back),
          onPressed: () {
            Navigator.pop(context);
          },
        ),
      ),
      body: Column(
        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: [
          Expanded(
            child: Padding(
              padding: const EdgeInsets.all(12.0),
              child: Container(
                alignment: Alignment.bottomLeft,
                child: Text(
                  'Your Result ',
                  style: kResultTitleTextStyle,
                ),
              ),
            ),
          ),
          Expanded(
              flex: 5,
              child: Reusable.reUsableCard(
                  colour: kActiveCardColor,
                  childWidget: Column(
                    //  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                    children: [
                      Expanded(
                        child: Container(
                          alignment: Alignment.center,
                          child: Text(
                            resultText.toUpperCase(),
                            style: kResultText_1,
                          ),
                        ),
                      ),
                      Expanded(
                        child: Text(
                          bmiResult,
                          style: kResultText_2,
                        ),
                      ),
                      Expanded(
                        child: Text(
                          interpretationText,
                          style: kResultText_3,
                          textAlign: TextAlign.center,
                        ),
                      ),
                      Text(
                        'Developed by KyawThetNaing.',
                        textAlign: TextAlign.center,
                        style: TextStyle(fontFamily: 'google', fontSize: 16.0),
                      ),
                      SizedBox(
                        height: 5,
                      )
                    ],
                  ))),
          Reusable.reusableButton(
              label: 'Re-Calculate', onPressed: () => Navigator.pop(context))
        ],
      ),
    );
  }
}
