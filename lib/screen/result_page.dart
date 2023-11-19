import 'package:bmi_calculator/constant.dart';
import 'package:bmi_calculator/components/reusable_card.dart';
import 'package:flutter/material.dart';

import '../components/calculate_contanier.dart';

class ResultPage extends StatelessWidget {
  String BMI;
  String result;
  String interPretation;


  ResultPage(this.BMI, this.result, this.interPretation, {super.key});

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        body: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            const Text(
              'YOUR RESULT',
              style: kNumberTextStyle,
            ),
            Expanded(
                child: ReusableCard(
              kInactiveCardColor,
              Column(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: [
                  Text(
                    result.toUpperCase(),
                    style: const TextStyle(color: Colors.green, fontSize: 18.0),
                  ),
                  Text(
                    BMI,
                    style: kNumberTextStyle,
                  ),
                  Text(
                    interPretation,
                    style: kLabelTextStyle,
                  ),
                ],
              ),
            )),
            GestureDetector(
                onTap: (){
                  Navigator.pop(context);
                },
                child: CalculateContainer('RE-CALCULATE')),
          ],
        ),
      ),
    );
  }
}
