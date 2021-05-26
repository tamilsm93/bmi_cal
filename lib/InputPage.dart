import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

import 'RoundIconButton.dart';

import 'constants.dart';

import 'calculator_brain.dart';

import 'bottom_button.dart';
import 'package:bmi_cal/result_page.dart';

import 'ReUsableCard.dart';
import 'ReusableIcon.dart';



enum Gender {
  male,
  female,
}

class InputPage extends StatefulWidget {
  @override
  _InputPageState createState() => _InputPageState();
}

class _InputPageState extends State<InputPage> {

  Gender selectedGender;
  int height = 180;
  int weight =  60;
  int age = 25;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Bmi Calculator'),
      ),
      body:  Column(
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: [
          Expanded(child: Row(
            children: <Widget> [
              Expanded(
                child: GestureDetector(
                 onTap: () {
                   setState(() {
                     selectedGender = Gender.male;
                   });
               },
                child: ReUsableCard(
                  colour: selectedGender == Gender.male ? activeCardColor : inactiveCardColor,
                  cardChild:  ReusableIcon(
                      icon: FontAwesomeIcons.mars,
                      label: 'Male'
                  ),
                ),
               ),
              ),
              Expanded(
                child: GestureDetector(
                  onTap: () {
                    setState(() {
                      selectedGender = Gender.female;
                    });
                  },
                  child: ReUsableCard(
                    colour: selectedGender == Gender.female ? activeCardColor : inactiveCardColor,
                    cardChild: ReusableIcon(
                        icon: FontAwesomeIcons.venus,
                        label: 'FeMale'
                    ),
                  )
              ),
             ),
            ],
          )),
          Expanded(
                 child:  ReUsableCard(
                     colour: activeCardColor,
                    cardChild: Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children:  <Widget> [
                        Text(
                          'HEIGHT',
                          style: labelTextStyle,
                        ),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          crossAxisAlignment: CrossAxisAlignment.baseline,
                          textBaseline:  TextBaseline.alphabetic,
                          children: <Widget> [
                            Text(
                              height.toString(),
                              style: NumberTextStyle
                            ),
                            Text(
                              'cm',
                              style: labelTextStyle,
                              )
                             ],
                            ),
                           SliderTheme(data: SliderTheme.of(context).copyWith(
                             thumbColor: Color(0xFFEB1555),
                             overlayColor: Color(0x29EB1555),
                               inactiveTrackColor: Color(0xFF8D8E98),
                               activeTrackColor: Colors.white,
                             thumbShape: RoundSliderThumbShape(enabledThumbRadius: 15.0),
                             overlayShape:
                               RoundSliderOverlayShape(overlayRadius: 30.0)
                           ),
                           child: Slider(
                                value: height.toDouble(),
                                min: 120.0,
                                max: 220.0,
                                onChanged:  (double newValue){
                                  setState(() {
                                    height = newValue.round();
                                  });
                                },
                            )
                           )
                      ],
                    ),
                 )
          ),
          Expanded(child: Row(
            children: [
              Expanded(
                 child:  ReUsableCard(
                     colour: activeCardColor,
                     cardChild: Column(
                       mainAxisAlignment: MainAxisAlignment.center,
                       children: <Widget> [
                          Text(
                            'Weight',
                            style: labelTextStyle,
                          ),
                         Text(
                           weight.toString(),
                           style:  NumberTextStyle,
                         ),
                         Row(
                           mainAxisAlignment: MainAxisAlignment.center,
                           children: <Widget> [
                             RoundIconButton(
                                icon: FontAwesomeIcons.minus,
                                onPressed: (){
                                  setState(() {
                                      weight--;
                                  });
                             }),
                             SizedBox(
                               width: 10.0,
                             ),
                             RoundIconButton(
                               icon: FontAwesomeIcons.plus,
                               onPressed: () {
                                 setState(() {
                                   weight++;
                                 });
                               })
                           ],
                         )
                       ],
                     ),
                 )
              ),
              Expanded(
                 child: ReUsableCard(
                     colour: activeCardColor,
                     cardChild: Column(
                       mainAxisAlignment: MainAxisAlignment.center,
                       children: <Widget> [
                         Text(
                           'AGE',
                           style: labelTextStyle,
                         ),
                         Text(
                            age.toString(),
                           style: NumberTextStyle,
                         ),
                         Row(
                           mainAxisAlignment:  MainAxisAlignment.center,
                           children: <Widget> [
                             RoundIconButton(
                               icon: FontAwesomeIcons.minus,
                               onPressed: () {
                                 setState(() {
                                    age --;
                                 });
                               }),
                             SizedBox(
                               width: 10.0,
                             ),
                             RoundIconButton(
                                 icon: FontAwesomeIcons.plus,
                                 onPressed: () {
                                   setState(() {
                                     age ++;
                                   });
                                 }),
                           ],
                         )
                       ],
                     ),
                 )
              ),
            ],
          )),
          BottomButton(
            buttonTitle: 'CALCULATE',
            onTap: () {
              CalculatorBrain calc =
                  CalculatorBrain(height: height, weight: weight);

              Navigator.push(
                  context,
                  MaterialPageRoute(
                      builder: (context) => ResultPage(
                  bmiResult: calc.calculateBMI(),
                  resultText: calc.getResult(),
                  interpretation: calc.getInterpretation(),
                   ),
                ),
              );
            }
            )
        ],
      )
    );
  }

}




