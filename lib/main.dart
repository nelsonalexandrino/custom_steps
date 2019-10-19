import 'package:customs_steppers/custom_steppers.dart';
import 'package:flutter/material.dart';

import './home_page.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Custom Steppers',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: HomePage(),
      routes: {
        CustomSteppers.routeName: (context) => CustomSteppers(),
      },
    );
  }
}
