import 'package:bmi_calculator/calculator_brain.dart';
import 'package:bmi_calculator/components/calculate_contanier.dart';
import 'package:bmi_calculator/screen/result_page.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import '../components/icon_content.dart';
import '../components/reusable_card.dart';
import '../constant.dart';

enum Gender { male, female }

class InputPage extends StatefulWidget {
  const InputPage({super.key});

  @override
  State<InputPage> createState() => _InputPageState();
}

class _InputPageState extends State<InputPage> {
  int height = 180;
  int weight = 60;
  int age = 20;

  Color maleCardColor = kInactiveCardColor;
  Color femaleCardColor = kInactiveCardColor;
  void updateColor(Gender selectedGender) {
    (selectedGender == Gender.male)
        ? {
            maleCardColor = kActiveCardColor,
            femaleCardColor = kInactiveCardColor
          }
        : {
            maleCardColor = kInactiveCardColor,
            femaleCardColor = kActiveCardColor
          };
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(title: const Text('BMI CALCULATOR')),
        body: Column(
          children: [
            Expanded(
              child: Row(
                children: [
                  Expanded(
                      child: ReusableCard(maleCardColor,
                          const IconContent(FontAwesomeIcons.mars, 'MALE'), () {
                    setState(() {
                      updateColor(Gender.male);
                    });
                  })),
                  Expanded(
                      child: ReusableCard(femaleCardColor,
                          const IconContent(FontAwesomeIcons.venus, 'FEMALE'),
                          () {
                    setState(() {
                      updateColor(Gender.female);
                    });
                  })),
                ],
              ),
            ),
            Expanded(
                child: ReusableCard(
              kActiveCardColor,
              Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  const Text(
                    'HEIGHT',
                    style: kLabelTextStyle,
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    crossAxisAlignment: CrossAxisAlignment.baseline,
                    textBaseline: TextBaseline.alphabetic,
                    children: [
                      Text(
                        height.toString(),
                        style: kNumberTextStyle,
                      ),
                      const Text(
                        'cm',
                        style: kLabelTextStyle,
                      )
                    ],
                  ),
                  SliderTheme(
                    data: SliderTheme.of(context).copyWith(
                        activeTrackColor: Colors.white,
                        inactiveTrackColor: Colors.grey,
                        thumbColor: Colors.pink,
                        thumbShape:
                            const RoundSliderThumbShape(enabledThumbRadius: 15),
                        overlayShape:
                            const RoundSliderOverlayShape(overlayRadius: 30),
                        overlayColor: const Color(0x29EB1555)),
                    child: Slider(
                        value: height.toDouble(),
                        min: 120.0,
                        max: 230.0,
                        onChanged: (double newValue) {
                          setState(() {
                            height = newValue.round();
                          });
                        }),
                  )
                ],
              ),
            )),
            Expanded(
                child: Row(
              children: [
                Expanded(
                    child: ReusableCard(
                        kActiveCardColor,
                        Column(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            const Text(
                              'WEIGHT',
                              style: kLabelTextStyle,
                            ),
                            Text(
                              weight.toString(),
                              style: kNumberTextStyle,
                            ),
                            Row(
                              mainAxisAlignment: MainAxisAlignment.center,
                              children: [
                                RoundIconButton(
                                  icon: kMinus,
                                  onPressed: () {
                                    setState(() {
                                      weight--;
                                    });
                                  },
                                ),
                                const SizedBox(width: 10.0),
                                RoundIconButton(
                                  icon: kPlus,
                                  onPressed: () {
                                    setState(() {
                                      weight++;
                                    });
                                  },
                                )
                              ],
                            ),
                          ],
                        )) //ReusableCard
                    ),
                Expanded(
                    child: ReusableCard(
                        kActiveCardColor,
                        Column(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            const Text(
                              'AGE',
                              style: kLabelTextStyle,
                            ),
                            Text(
                              age.toString(),
                              style: kNumberTextStyle,
                            ),
                            Row(
                              mainAxisAlignment: MainAxisAlignment.center,
                              children: [
                                RoundIconButton(
                                    icon: kMinus,
                                    onPressed: () {
                                      setState(() {
                                        age--;
                                      });
                                    }),
                                const SizedBox(
                                  width: 10.0,
                                ),
                                RoundIconButton(
                                    icon: kPlus,
                                    onPressed: () {
                                      setState(() {
                                        age++;
                                      });
                                    }),
                              ],
                            ),
                          ],
                        )) //ReusableCard
                    ),
              ],
            )),
            GestureDetector(
              onTap: () {
                CalculatorBrain calculatorBrain =
                    CalculatorBrain(height: height, weight: weight);
                Navigator.push(
                    context,
                    MaterialPageRoute(
                        builder: (context) => ResultPage(
                            calculatorBrain.calculatorBMI(),
                            calculatorBrain.getResult(),
                            calculatorBrain.getInterPretation())));
              },
              child: CalculateContainer('CALCULATE'),
            )
          ],
        ));
  }
}

class RoundIconButton extends StatelessWidget {
  final IconData icon;
  final VoidCallback onPressed;

  const RoundIconButton(
      {super.key, required this.icon, required this.onPressed});

  @override
  Widget build(BuildContext context) {
    return RawMaterialButton(
      onPressed: onPressed,
      elevation: 0.0,
      constraints: const BoxConstraints.tightFor(width: 56.0, height: 56.0),
      fillColor: Colors.grey,
      shape: const CircleBorder(),
      child: Icon(icon),
    );
  }
}
