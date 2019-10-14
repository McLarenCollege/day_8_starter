import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

class InputPage extends StatefulWidget {
  @override
  _InputPageState createState() => _InputPageState();
}

enum Gender { male, female }

class _InputPageState extends State<InputPage> {
  Gender gender;
  Color activeCardColor = Color(0xFF1D1F31);
  Color inactiveCardColor = Color(0xFF111328);
  TextStyle inactiveTextStyle = TextStyle(fontSize: 24, color: Colors.white60);
  TextStyle activeTextStyle = TextStyle(fontSize: 24, color: Colors.white);
  Color activeTextColor = Colors.white;
  Color inactiveTextColor = Colors.white60;
  int height = 183;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('BMI CALCULATOR'),
        centerTitle: true,
      ),
      body: Column(
        children: <Widget>[
          Expanded(
            child: Row(
              children: <Widget>[
                Expanded(
                  child: ReusableCard(
                    child: Column(
                      mainAxisSize: MainAxisSize.max,
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: <Widget>[
                        Icon(FontAwesomeIcons.mars,
                            size: 100,
                            color: gender == Gender.male
                                ? activeTextColor
                                : inactiveTextColor),
                        SizedBox(
                          height: 10,
                        ),
                        Text(
                          'MALE',
                          style: gender == Gender.male
                              ? activeTextStyle
                              : inactiveTextStyle,
                        )
                      ],
                    ),
                    color: gender == Gender.male
                        ? activeCardColor
                        : inactiveCardColor,
                    // if(gender== 0){
                    // return activeCardColor;
                    // } else{
                    // return inavctiveCardColor
                    //}
                    tapCallback: () {
                      setState(() {
                        gender = Gender.male;
                      });
                      print('Male selected');
                    },
                  ),
                ),
                Expanded(
                  child: ReusableCard(
                    child: Column(
                      mainAxisSize: MainAxisSize.max,
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: <Widget>[
                        Icon(
                          FontAwesomeIcons.venus,
                          size: 100,
                          color: gender == Gender.female
                              ? activeTextColor
                              : inactiveTextColor,
                        ),
                        SizedBox(
                          height: 10,
                        ),
                        Text(
                          'FEMALE',
                          style: gender == Gender.female
                              ? activeTextStyle
                              : inactiveTextStyle,
                        )
                      ],
                    ),
                    color: gender == Gender.female
                        ? activeCardColor
                        : inactiveCardColor,
                    tapCallback: () {
                      setState(() {
                        gender = Gender.female;
                      });

                      print('Female selected');
                    },
                  ),
                )
              ],
            ),
          ),
          Expanded(
            child: ReusableCard(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.center,
                mainAxisAlignment: MainAxisAlignment.center,
                children: <Widget>[
                  Text(
                    'HEIGHT',
                    style: TextStyle(fontSize: 24),
                    textAlign: TextAlign.center,
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    crossAxisAlignment: CrossAxisAlignment.baseline,
                    textBaseline: TextBaseline.alphabetic,
                    children: <Widget>[
                      Text(
                        height.toString(),
                        style: TextStyle(
                            fontSize: 42, fontWeight: FontWeight.bold),
                      ),
                      Text(
                        'cm',
                        style: TextStyle(fontSize: 24),
                      ),
                    ],
                  ),
                  SliderTheme(
                    data: SliderThemeData().copyWith(
                      thumbShape: RoundSliderThumbShape(
                        enabledThumbRadius: 15.0,
                      ),
                      overlayShape: RoundSliderOverlayShape(
                        overlayRadius: 25.0,
                      ),
                      thumbColor: Color(0XFFEB1555),
                      overlayColor: Color(0X29EB1555),
                      activeTrackColor: Colors.white,
                    ),
                    child: Slider(
                      min: 110,
                      max: 210,
                      value: height.toDouble(),
                      inactiveColor: Color(0XFF8D8E98),
                      onChanged: (double newValue) {
                        setState(() {
                          height = newValue.toInt();
                        });
                      },
                    ),
                  )
                ],
              ),
            ),
          ),
          Expanded(
            child: Row(
              children: <Widget>[
                Expanded(
                  child: ReusableCard(),
                ),
                Expanded(
                  child: ReusableCard(),
                )
              ],
            ),
          ),
        ],
      ),
    );
  }
}

class ReusableCard extends StatelessWidget {
  final Color color;
  final Widget child;
  final Function tapCallback;

  ReusableCard(
      {this.color = const Color(0xFF1D1F31), this.child, this.tapCallback});

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: tapCallback,
      child: Container(
        margin: EdgeInsets.all(12),
        decoration: BoxDecoration(
          color: color,
          borderRadius: BorderRadius.all(
            Radius.circular(12),
          ),
        ),
        child: child,
      ),
    );
  }
}
