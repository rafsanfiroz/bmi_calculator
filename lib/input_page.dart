import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'resuable_card.dart';
import 'icon_content.dart';
import 'result_page.dart';
import 'bmi_result_calculate.dart';
const activeColor = Color(0xFF272A4D);
const inactiveColor = Color(0xFF111328);

enum Gender {
  male,
  female,
}

class InputPage extends StatefulWidget {
  const InputPage({super.key});

  @override
  State<InputPage> createState() => _InputPageState();
}

class _InputPageState extends State<InputPage> {
  Gender? selectedGender;
  int height = 180;
  int weight = 60;
  int age = 20;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: Center(child: Text('BMI Calculator')),
        ),
        body: Padding(
          padding: const EdgeInsets.all(8.0),
          child: Column(
            children: [
              Expanded(
                child: Row(
                  children: [
                    Expanded(
                        child: GestureDetector(
                      onTap: () {
                        setState(() {
                          selectedGender = Gender.male;
                        });
                      },
                      child: MyContainer(
                        colour: selectedGender == Gender.male
                            ? activeColor
                            : inactiveColor,
                        cardChild: IconContents(
                          iconData: FontAwesomeIcons.mars,
                          label: 'MALE',
                        ),
                      ),
                    )),
                    SizedBox(
                      width: 10,
                    ),
                    Expanded(
                        child: GestureDetector(
                      onTap: () {
                        setState(() {
                          selectedGender = Gender.female;
                        });
                      },
                      child: MyContainer(
                        colour: selectedGender == Gender.female
                            ? activeColor
                            : inactiveColor,
                        cardChild: IconContents(
                          iconData: FontAwesomeIcons.venus,
                          label: 'Female',
                        ),
                      ),
                    ))
                  ],
                ),
              ),
              SizedBox(
                height: 10,
              ),
              Expanded(
                  child: MyContainer(
                colour: activeColor,
                cardChild: Column(
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    Text('Height',
                        style: TextStyle(fontSize: 18, color: Colors.white)),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      crossAxisAlignment: CrossAxisAlignment.baseline,
                      textBaseline: TextBaseline.alphabetic,
                      children: [
                        Text(
                          height.toString(),
                          style: TextStyle(
                            fontSize: 50,
                            color: Colors.white,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                        Text(
                          'cm',
                          style: TextStyle(
                            fontSize: 50,
                            color: Colors.white,
                            fontWeight: FontWeight.bold,
                          ),
                        )
                      ],
                    ),
                    SliderTheme(
                      data: SliderTheme.of(context).copyWith(
                        activeTickMarkColor: Color(0xFFEB1555),
                        inactiveTickMarkColor: Colors.white,
                        thumbColor: Color(0xFFEB1555),
                        overlayColor: Color(0x29EB1555),
                        thumbShape:
                            RoundSliderThumbShape(enabledThumbRadius: 15.0),
                        overlayShape:
                            RoundSliderOverlayShape(overlayRadius: 30),
                      ),
                      child: Slider(
                          value: height.toDouble(),
                          min: 120.0,
                          max: 220.0,
                          onChanged: (double newValue) {
                            setState(() {
                              height = newValue.round();
                            });
                          }),
                    )
                  ],
                ),
              )),
              SizedBox(
                height: 10,
              ),
              Expanded(
                child: Row(
                  children: [
                    Expanded(
                        child: Column(
                      children: [
                        MyContainer(
                          colour: activeColor,
                        ),
                        Text('Weight',
                            style:
                                TextStyle(fontSize: 18, color: Colors.white)),

                        Text(
                          weight.toString(),
                          style: TextStyle(
                            fontSize: 50,
                            color: Colors.white,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            RawMaterialButton(
                                child: Icon(
                                  FontAwesomeIcons.minus,
                                  color: Colors.white,
                                ),
                                fillColor: Colors.grey,
                                shape: CircleBorder(),
                                onPressed: () {
                                  setState(() {
                                    weight--;
                                  });
                                }),
                            SizedBox(
                              width: 10.0,
                            ),

                            RawMaterialButton(
                                child: Icon(
                                  FontAwesomeIcons.add,
                                  color: Colors.white,
                                ),
                                fillColor: Colors.grey,
                                shape: CircleBorder(),
                                onPressed: () {
                                  setState(() {
                                    weight++;
                                  });
                                }),
                            //  Icon(FontAwesomeIcons.minus)
                          ],
                        ),
                        //
                      ],
                    )),
                    SizedBox(
                      width: 10,
                    ),
                    Expanded(
                        child: Column(
                      children: [
                        MyContainer(
                          colour: activeColor,
                        ),
                        Text('Age',
                            style:
                                TextStyle(fontSize: 18, color: Colors.white)),
                        Text(
                          age.toString(),
                          style: TextStyle(
                            fontSize: 50,
                            color: Colors.white,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            RawMaterialButton(
                                child: Icon(FontAwesomeIcons.minus,
                                    color: Colors.white),
                                fillColor: Colors.grey,
                                shape: CircleBorder(),
                                // focusColor: Colors.grey,
                                onPressed: () {
                                  setState(() {
                                    age--;
                                  });
                                  //   Icon(FontAwesomeIcons.minus,color: Colors.white);
                                }),
                            SizedBox(width: 10.0),
                            RawMaterialButton(
                                child: Icon(
                                  FontAwesomeIcons.add,
                                  color: Colors.white,
                                ),
                                fillColor: Colors.grey,
                                shape: CircleBorder(),
                                onPressed: () {
                                  setState(() {
                                    age++;
                                  });
                                })
                          ],
                        )
                      ],
                    ))
                  ],
                ),
              ),
              Container(
                child: ElevatedButton(
                  onPressed: () {

                   Calculator calC = Calculator(weight: weight, height: height) ;



                    Navigator.push(context,
                        MaterialPageRoute(builder: (context) {
                      return ResultPage(
                        bmiCalculator: calC.CalculateBmi(),
                        getResult: calC.getResult(),
                        interpretation: calC.interPretation(),



                      );
                    }));
                  },
                  child: Text(
                    'Calculate',
                    style: TextStyle(
                        // backgroundColor: Colors.pink,
                        ),
                  ),
                ),
                margin: EdgeInsets.only(top: 10.0),
                color: Color(0xFFEB1555),
                height: 70.0,
                width: double.infinity,
              )
            ],
          ),
        ));
  }
}

class RoundIconButton extends StatelessWidget {
  // const RoundIconButton({super.key});

  RoundIconButton({required this.icon, required this.onPressed});

  final IconData icon;

  final Function()? onPressed;

  @override
  Widget build(BuildContext context) {
    return RawMaterialButton(
      onPressed: onPressed,
      child: Icon(
        icon,
        color: Colors.white,
      ),
      shape: CircleBorder(),
      elevation: 2.0,
      constraints: BoxConstraints.tightFor(width: 55.0, height: 56.0),
    );
  }
}
