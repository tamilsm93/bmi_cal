
import 'package:bmi_cal/bottom_button.dart';
import 'package:flutter/material.dart';

import 'constants.dart';
import 'ReUsableCard.dart';
import 'ReusableIcon.dart';

class ResultPage extends StatelessWidget {

  ResultPage({@required this.interpretation,
        @required this.bmiResult,
        @required this.resultText});

  final String bmiResult;
  final String resultText;
  final String interpretation;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('BMI Calculator'),
      ),
      body: Column(
        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: <Widget> [
          Expanded(
            child: Container(
              padding: EdgeInsets.all(15.0),
              alignment: Alignment.bottomLeft,
              child: Text(
                'your Result',
                style: TitleTextStyle,
              ),
            ),
          ),
         Expanded(

           flex: 5,
           child:  ReUsableCard(
             colour:  activeCardColor,
             cardChild:  Column(
               mainAxisAlignment: MainAxisAlignment.spaceEvenly,
               crossAxisAlignment: CrossAxisAlignment.center,
             children: <Widget>[
               Text(
                resultText.toUpperCase(),
                style: ResultTextStyle,
                 ),
                 Text(
                 bmiResult,
                 style: BMITextStyle,
                 ),
                 Text(
                 interpretation,
                 style: BodyTextStyle,
                 ),
             ],
           ),
         ),
      ),
     BottomButton(buttonTitle: 'Re Calculate',
     onTap: (){
         Navigator.pop(context);
          },
        )
        ],
      ),
    );
  }
}
