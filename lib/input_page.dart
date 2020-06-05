import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'components/reusable_card.dart';
import 'components/icon_content.dart';
import 'constants.dart';
import 'result_page.dart';
import 'components/bottom_button.dart';
import 'components/round_icon_button.dart';
import 'calculator_brain.dart';
import 'dart:math';



class InputPage extends StatefulWidget {
  @override
  _InputPageState createState() => _InputPageState();
}

class _InputPageState extends State<InputPage> {

  Gender selectedGender;
  int height = 180;
  int weight = 60;
  int age = 10;
  double impHeightInch;
  double impHeightFt;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('BMI CALCULATOR'),
      ),
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: <Widget>[
//          Expanded(
//            child: Row(
//              children: <Widget>[
//                Expanded(
//                  child: ReusableCard(
//                    colour: kInactiveCardColor,
//                    cardChild: IconContent(
//                      genderIcon: FontAwesomeIcons.ellipsisH, gender: 'Metric',
//                    ),
//                  ),
//                ),
//                Expanded(
//                  child: ReusableCard(
//                    colour: kInactiveCardColor,
//                    cardChild: IconContent(
//                      genderIcon: FontAwesomeIcons.ellipsisV, gender: 'Imperial',
//                    ),
//                  ),
//                ),
//              ],
//            ),
//          ),
          Expanded(
            child: Row(
              children: <Widget>[
                Expanded(
                  child: ReusableCard(
                    onPress: (){
                      setState(() {
                        selectedGender = Gender.male;
                      });
                    },
                      colour: selectedGender == Gender.male ? kActiveCardColor : kInactiveCardColor,
                          cardChild: IconContent(genderIcon: FontAwesomeIcons.mars,
                              gender: 'MALE',
                          ),
                  ),
                ),
                Expanded(
                  child: ReusableCard(
                    onPress: (){
                      setState(() {
                        selectedGender = Gender.female;
                      });
                    },
                      colour: selectedGender == Gender.female ? kActiveCardColor : kInactiveCardColor,
                cardChild: IconContent(genderIcon: FontAwesomeIcons.venus,
                  gender: 'FEMALE',
                ),
                  ),
                ),
              ],
            ),
          ),
          Expanded(
            child: GestureDetector(
              onDoubleTap: (){
                setState(() {
               kHUnitLabel = kHUnitLabel == kMetHeightUnit ? kImpHeightUnit : kMetHeightUnit;
               kHUnitLabel = kHUnitLabel == kMetHeightUnit ?
               impHeightInch = height * 0.3937;
                impHeightFt = impHeightInch / 12;

                });
              },
              child: ReusableCard(
                colour: kActiveCardColor,
              cardChild: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: <Widget>[
                Text('HEIGHT',
                  style: kLabelTextStyle,
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  crossAxisAlignment: CrossAxisAlignment.baseline,
                  textBaseline: TextBaseline.alphabetic,
                  children: <Widget>[
                    Text(
                      height.toString(),
                      style: kNumberTextStyle,
                    ),
                    Text(
                        kHUnitLabel,
                      style: kLabelTextStyle,
                    )
                  ],
                ),
                  SliderTheme(
                    data: SliderTheme.of(context).copyWith(
                      activeTrackColor: Colors.white,
                      inactiveTrackColor: Color(0xFF8D8E98),
                      thumbColor: Color(0xFFEB1555),
                      overlayColor: Color(0x29EB1555),
                      thumbShape: RoundSliderThumbShape(enabledThumbRadius: 15.0),
                      overlayShape: RoundSliderOverlayShape(overlayRadius: 30.0),
                    ),
                    child: Slider(
                      value: height.toDouble(),
                      min: 120.0,
                      max: 220.0,
                      onChanged: (double newValue){
                        setState(() {
                          height = newValue.round();
                        });
                      },

                    ),
                  ),
              ],
              ),
              ),
            ),
          ),
          Expanded(
            child: Row(
              children: <Widget>[
                Expanded(child: ReusableCard(colour: kActiveCardColor,
                cardChild: Column(
    mainAxisAlignment: MainAxisAlignment.center,
                  children: <Widget>[
                    Text('WEIGHT',
                    style: kLabelTextStyle,
                    ),
                    Text(
                      weight.toString(),
                      style: kNumberTextStyle,
                    ),
                    Row(mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                      children: <Widget>[
                      RoundIconButton(
                        icon: FontAwesomeIcons.minus,
                        onPressed: (){
                          setState(() {
                            weight--;
                            print(weight.toString());
                          });
                        },
                      ),
                        RoundIconButton(
                          icon: FontAwesomeIcons.plus,
                          onPressed: (){
                            setState(() {
                              weight++;
                            });
                          },
                        ),
                    ],
                    ),
                  ],
    ),
                ),

                ),
                Expanded(
                  child: ReusableCard(
                    colour: kActiveCardColor,
                  cardChild: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: <Widget>[
                      Text('AGE',
                        style: kLabelTextStyle,
                      ),
                      Text(
                        age.toString(),
                        style: kNumberTextStyle,
                      ),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                        children: <Widget>[
                          RoundIconButton(
                            icon: FontAwesomeIcons.minus,
                            onPressed: (){
                              setState(() {
                                age--;
                                print(age.toString());
                              });
                            },
                          ),
                          RoundIconButton(
                            icon: FontAwesomeIcons.plus,
                            onPressed: (){
                              setState(() {
                                age++;
                              });
                            },
                          ),
                        ],
                      ),
                    ],
                  ),
                ),

                ),
              ],
            ),
          ),
          BottomButton(buttonTitle: 'CALCULATE', onTap: (){

            CalculatorBrain calc = CalculatorBrain(height: height, weight: weight);


            Navigator.push(
              context,
              MaterialPageRoute(builder: (context) => ResultsPage(
                bmiResult: calc.calculateBMI(),
                resultText: calc.getResults(),
                interpretation: calc.getInterpretation(),
              )),
            );
          },),
        ],
      ),
    );
  }
}





