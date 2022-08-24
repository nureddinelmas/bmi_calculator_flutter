import 'package:bmi_calculator_flutter/constants/app_constants.dart';
import 'package:flutter/material.dart';
import 'package:flutter/src/foundation/key.dart';
import 'package:flutter/src/widgets/framework.dart';

class ShowAverage extends StatelessWidget {
  final double average;
  final String category;
  const ShowAverage({Key? key, required this.average, required this.category})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      crossAxisAlignment: CrossAxisAlignment.center,
      children: [
        Text(
          "Värdet -> ",
          style: Constants.averageStyle,
        ),
        Text(
          average.toStringAsFixed(2),
          style: Constants.averageValueStyle,
        ),
        Text(
          category,
          style: Constants.averageStyle,
        )
      ],
    );
  }
}
