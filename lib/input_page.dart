import 'package:flutter/material.dart';

import 'bmi_calculator.dart';
import 'bottom_container.dart';
import 'constants.dart';
import 'modification_button.dart';
import 'results_page.dart';
import 'reusable_card.dart';
import 'top_tile_layout.dart';

enum gender { male, female }

class InputPage extends StatefulWidget {
  @override
  _InputPageState createState() => _InputPageState();
}

class _InputPageState extends State<InputPage> {
  var selectedGender;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        title: Text('BMI CALCULATOR'),
      ),
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: [
          Expanded(
            child: Row(
              children: [
                Expanded(
                  child: ReusableCard(
                    onClick: () {
                      setState(() {
                        selectedGender = gender.male;
                      });
                    },
                    cardChild: TopTileLayout(
                      selectedIcon: Icons.male,
                      selectedText: 'MALE',
                    ),
                    selectedColour: selectedGender == gender.male
                        ? kActiveCardColor
                        : kInactiveCardColor,
                  ),
                ),
                Expanded(
                  child: ReusableCard(
                    onClick: () {
                      setState(() {
                        selectedGender = gender.female;
                      });
                    },
                    cardChild: TopTileLayout(
                      selectedIcon: Icons.female,
                      selectedText: 'FEMALE',
                    ),
                    selectedColour: selectedGender == gender.female
                        ? kActiveCardColor
                        : kInactiveCardColor,
                  ),
                )
              ],
            ),
          ),
          Expanded(
            child: ReusableCard(
              onClick: () => null,
              cardChild: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Text(
                    'HEIGHT',
                    style: kTileDescriptionStyle,
                  ),
                  Row(
                    crossAxisAlignment: CrossAxisAlignment.baseline,
                    textBaseline: TextBaseline.alphabetic,
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Text(kHeight.toString(), style: kNumberDisplayStyle),
                      Text(
                        'cm',
                        style: kTileDescriptionStyle,
                      )
                    ],
                  ),
                  SliderTheme(
                    data: SliderThemeData(
                        activeTrackColor: kBottomContainerColor,
                        inactiveTrackColor: kInactiveSliderColor,
                        thumbColor: kBottomContainerColor,
                        overlayColor: Color(0x29EB1555),
                        thumbShape:
                            RoundSliderThumbShape(enabledThumbRadius: 15),
                        overlayShape:
                            RoundSliderOverlayShape(overlayRadius: 30)),
                    child: Slider(
                        value: kHeight.toDouble(),
                        min: 120,
                        max: 240,
                        activeColor: kBottomContainerColor,
                        onChanged: (newValue) {
                          setState(() {
                            kHeight = newValue.round();
                          });
                        }),
                  )
                ],
              ),
            ),
          ),
          Expanded(
            child: Row(
              children: [
                Expanded(
                  child: ReusableCard(
                      onClick: () => null,
                      cardChild: Column(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Text(
                            'WEIGHT',
                            style: kTileDescriptionStyle,
                          ),
                          Text(
                            kWeight.toString(),
                            style: kNumberDisplayStyle,
                          ),
                          Row(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              ModificationButton(
                                modificationVariable:
                                    kModificationVariable.remove,
                                onChange: () {
                                  setState(() {
                                    kWeight--;
                                  });
                                },
                              ),
                              ModificationButton(
                                onChange: () {
                                  setState(() {
                                    kWeight++;
                                  });
                                },
                                modificationVariable: kModificationVariable.add,
                              ),
                            ],
                          )
                        ],
                      )),
                ),
                Expanded(
                  child: ReusableCard(
                      onClick: () => null,
                      cardChild: Column(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Text(
                            'AGE',
                            style: kTileDescriptionStyle,
                          ),
                          Text(
                            kAge.toString(),
                            style: kNumberDisplayStyle,
                          ),
                          Row(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              ModificationButton(
                                modificationVariable:
                                    kModificationVariable.remove,
                                onChange: () {
                                  setState(() {
                                    kAge--;
                                  });
                                },
                              ),
                              ModificationButton(
                                onChange: () {
                                  setState(() {
                                    kAge++;
                                  });
                                },
                                modificationVariable: kModificationVariable.add,
                              ),
                            ],
                          )
                        ],
                      )),
                ),
              ],
            ),
          ),
          BottomContainer(
            description: 'CALCULATE',
            uponClick: () {
              BMICalculator BmiCalculator = BMICalculator();
              Navigator.push(
                context,
                MaterialPageRoute(
                  builder: (context) => ResultsPage(
                      bmi: BmiCalculator.GetBMI(),
                      description: BmiCalculator.GetResult(),
                      finalNote: BmiCalculator.GetDescription()),
                ),
              );
            },
          )
        ],
      ),
    );
  }
}
