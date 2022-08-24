import 'package:bmi_calculator_flutter/constants/app_constants.dart';
import 'package:bmi_calculator_flutter/widgets/bmi_main_page.dart';
import 'package:flutter/material.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Dinamik Ortalama Hesapla',
      theme: ThemeData(
          primarySwatch: Constants.mainColor,
          visualDensity: VisualDensity.adaptivePlatformDensity),
      home: BmiMainPage(),
    );
  }
}
