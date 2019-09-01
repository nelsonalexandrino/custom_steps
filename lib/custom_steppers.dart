import 'dart:math';
import 'dart:ui' as ui;

import 'package:flutter/material.dart';

class CustomSteppers extends StatefulWidget {
  static String routeName = '/add-account';
  @override
  _CustomSteppersState createState() => _CustomSteppersState();
}

class _CustomSteppersState extends State<CustomSteppers>
    with TickerProviderStateMixin {
  double percentage;
  int stepIndex;
  double newPercentage = 0.0;
  AnimationController percentageAnimationController;

  @override
  void initState() {
    super.initState();
    setState(() {
      percentage = 0.0;
      stepIndex = 0;
    });

    percentageAnimationController =
        AnimationController(vsync: this, duration: Duration(milliseconds: 1000))
          ..addListener(() {
            setState(() {
              percentage = ui.lerpDouble(percentage, newPercentage,
                  percentageAnimationController.value);
            });
          });
  }

  @override
  Widget build(BuildContext context) {
    final _statusBarHeight = MediaQuery.of(context).padding.top;
    const double _kToolbarHeight = 56.0;
    final curScaleFactor = MediaQuery.of(context).textScaleFactor;
    final _deviceHeight = MediaQuery.of(context).size.height;
    final _deviceWidth = MediaQuery.of(context).size.width;

    print('quantas vezes?');

    return Scaffold(
      /* floatingActionButton: FloatingActionButton.extended(
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.all(
            Radius.circular(12),
          ),
        ),
        isExtended: true,
        elevation: 0,
        label: Text('Next'),
        icon: Icon(Icons.forward_10),
        onPressed: () {
          setState(() {
            stepIndex += 1;
            percentage = newPercentage;
            newPercentage += 10;
            if (newPercentage > 100.0) {
              percentage = 0.0;
              newPercentage = 0.0;
            }

            if (stepIndex > 9) {
              stepIndex = 0;
            }
            percentageAnimationController.forward(from: 0.0);
          });
        },
      ), */
      appBar: PreferredSize(
        preferredSize: Size.fromHeight(_statusBarHeight + _kToolbarHeight + 20),
        child: Container(
          color: Theme.of(context).primaryColor,
          height: _statusBarHeight + _kToolbarHeight + 20,
          padding: EdgeInsets.only(top: 10),
          child: Row(
            children: <Widget>[
              Container(
                child: Row(
                  children: <Widget>[
                    IconButton(
                      icon: Icon(
                        Icons.arrow_back_ios,
                        color: Colors.white,
                      ),
                      onPressed: () {
                        Navigator.of(context).pop();
                      },
                    ),
                    CustomPaint(
                      foregroundPainter: MyPainter(
                        lineColor: Colors.grey.withOpacity(.5),
                        completeColor: Color(0xFF4CAF50),
                        completePercent: percentage,
                        width: 4.0,
                      ),
                      child: Padding(
                        padding: const EdgeInsets.all(8.0),
                        child: Container(
                          child: Center(
                            child: Text(
                              '${stepIndex + 1} de 10',
                              style: TextStyle(fontSize: 10 * curScaleFactor),
                            ),
                          ),
                        ),
                      ),
                    ),
                    SizedBox(
                      width: 16,
                    ),
                    Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: <Widget>[
                        Text(
                          'Dados do cliente',
                          style: TextStyle(
                            fontSize: 14 * curScaleFactor,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                        Text(
                          'Proximo: Contas',
                          style: TextStyle(
                            fontSize: 10 * curScaleFactor,
                            fontWeight: FontWeight.w600,
                          ),
                        ),
                      ],
                    ),
                  ],
                ),
              ),
              Expanded(
                //width: double.infinity,
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.end,
                  //crossAxisAlignment: CrossAxisAlignment.end,
                  children: <Widget>[
                    IconButton(
                      icon: Icon(
                        Icons.save,
                        color: Colors.white,
                      ),
                      onPressed: () {},
                    )
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
      body: LayoutBuilder(
        builder: (context, constraints) {
          final height = constraints.maxHeight * .8;
          return Stack(
            fit: StackFit.expand,
            children: <Widget>[
              Container(
                height: height,
                child: IndexedStack(
                  index: stepIndex,
                  children: <Widget>[
                    Container(
                      color: Colors.amber,
                      width: double.infinity,
                      height: height,
                      child: Center(
                        child: Text('1'),
                      ),
                    ),
                    Container(
                      color: Colors.black,
                      width: double.infinity,
                      height: height,
                      child: Center(
                        child: Text(
                          '2',
                          style: TextStyle(
                            color: Colors.white,
                          ),
                        ),
                      ),
                    ),
                    Container(
                      color: Colors.teal,
                      width: double.infinity,
                      height: height,
                      child: Center(
                        child: Text('3'),
                      ),
                    ),
                    Container(
                      color: Colors.red,
                      width: double.infinity,
                      height: height,
                      child: Center(
                        child: Text('4'),
                      ),
                    ),
                    Container(
                      color: Colors.green,
                      width: double.infinity,
                      height: height,
                      child: Center(
                        child: Text('5'),
                      ),
                    ),
                    Container(
                      color: Colors.brown,
                      width: double.infinity,
                      height: height,
                      child: Center(
                        child: Text('6'),
                      ),
                    ),
                    Container(
                      color: Colors.purple,
                      width: double.infinity,
                      height: height,
                      child: Center(
                        child: Text('7'),
                      ),
                    ),
                    Container(
                      color: Colors.pink,
                      width: double.infinity,
                      height: height,
                      child: Center(
                        child: Text('8'),
                      ),
                    ),
                    Container(
                      color: Colors.orange,
                      width: double.infinity,
                      height: height,
                      child: Center(
                        child: Text('9'),
                      ),
                    ),
                    Container(
                      color: Colors.lime,
                      width: double.infinity,
                      height: height,
                      child: Center(
                        child: Text('10'),
                      ),
                    ),
                  ],
                ),
              ),
              Positioned(
                width: _deviceWidth,
                bottom: 3,
                //width: double.infinity,
                child: Padding(
                  padding: const EdgeInsets.symmetric(
                    horizontal: 20,
                  ),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: <Widget>[
                      RaisedButton(
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(12),
                        ),
                        child: Text('BACK'),
                        onPressed: () {
                          setState(() {
                            stepIndex -= 1;
                            percentage = newPercentage;
                            newPercentage -= 10;
                            if (newPercentage < 0) {
                              percentage = 0.0;
                              newPercentage = 0.0;
                            }

                            if (stepIndex < 0) {
                              stepIndex = 0;
                            }
                            percentageAnimationController.forward(from: 0.0);
                          });
                        },
                      ),
                      RaisedButton(
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(12),
                        ),
                        child: Text('NEXT'),
                        onPressed: () {
                          setState(() {
                            stepIndex += 1;
                            percentage = newPercentage;
                            newPercentage += 10;
                            if (newPercentage > 100.0) {
                              percentage = 0.0;
                              newPercentage = 0.0;
                            }

                            if (stepIndex > 9) {
                              stepIndex = 0;
                            }
                            percentageAnimationController.forward(from: 0.0);
                          });
                        },
                      ),
                    ],
                  ),
                ),
              )
            ],
          );
        },
      ),
    );
  }
}

/*
AppBar(
        elevation: 0,
        centerTitle: false,
        titleSpacing: 0,
        title: Container(
          height: 35,
          width: 35,
          child: CustomPaint(
            foregroundPainter: MyPainter(
              lineColor: Colors.white,
              completeColor: Color(0xFF4CAF50),
              completePercent: percentage,
              width: 4.0,
            ),
            child: Padding(
              padding: const EdgeInsets.all(8.0),
              child: Container(
                child: Center(
                  child: Text(
                    '1 de 3',
                    style: TextStyle(fontSize: 6),
                  ),
                ),
              ),
            ),
          ),
        ),
      )

*/

class MyPainter extends CustomPainter {
  Color lineColor;
  Color completeColor;
  double completePercent;
  double width;

  MyPainter({
    this.lineColor,
    this.completeColor,
    this.completePercent,
    this.width,
  });

  @override
  void paint(Canvas canvas, Size size) {
    Paint line = Paint()
      ..color = lineColor
      ..strokeCap = StrokeCap.round
      ..style = PaintingStyle.stroke
      ..strokeWidth = width;
    Paint complete = Paint()
      ..color = completeColor
      ..strokeCap = StrokeCap.round
      ..style = PaintingStyle.stroke
      ..strokeWidth = width;
    Offset center = Offset(size.width / 2, size.height / 2);
    double radius = min(size.width / 2, size.height / 2);
    canvas.drawCircle(center, radius, line);
    double arcAngle = 2 * pi * (completePercent / 100);
    canvas.drawArc(Rect.fromCircle(center: center, radius: radius), -pi / 2,
        arcAngle, false, complete);
  }

  @override
  bool shouldRepaint(CustomPainter oldDelegate) {
    return true;
  }
}
