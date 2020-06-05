import 'package:flutter/material.dart';
import 'constants.dart';
import 'components/reusable_card.dart';
import 'components/bottom_button.dart';


class ResultsPage extends StatelessWidget {

  ResultsPage({@required this.interpretation, @required this.bmiResult, @required this.resultText});

  final String bmiResult;
  final String resultText;
  final String interpretation;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('BMI CALCULATOR'),
      ),
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.stretch,
        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
        children: <Widget>[
          Expanded(
            child: Container(
              child: Text(
                'Your Result',
                style: kTitleTextStyle,
                ),
              ),
            ),
            Expanded(
              flex: 5,
              child: ReusableCard(
                colour: kActiveCardColor,
                cardChild: Column(
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: <Widget>[
                    Text(
                       resultText.toUpperCase(),
style: kResultTextStyle,
                    ),
                    Text(
                      bmiResult,
                     style: kBMITextStyle,
                    ),
                    Text(
                        interpretation,
                      textAlign: TextAlign.center,
                      style: kBodyTextStye,
                    ),
                  ],
                ),
              ),
          ),
          BottomButton(
            buttonTitle: (
            'RECALCULATE'
          ),
            onTap: (){
              Navigator.pop(context);
            },
          ),
        ],

      ),
    );
  }
}
